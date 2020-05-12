import 'package:flutter/material.dart';
import 'package:foodfficient/models/pantry/pantryFunctions.dart';
import 'package:foodfficient/models/pantry/pantryModel.dart';
import 'package:foodfficient/utils/pantryListView.dart';
import 'package:foodfficient/widgets/addItem.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsManager {

  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance = PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool _initialized = false;

  Future<void> init() async {
    if (!_initialized) {
      // For iOS request permission first.
      _firebaseMessaging.requestNotificationPermissions();
      _firebaseMessaging.configure();

      // For testing purposes print the Firebase Messaging token
      String token = await _firebaseMessaging.getToken();
      print("FirebaseMessaging token: $token");
      
      _initialized = true;
    }
  }
}

class HomePage extends StatefulWidget{
  HomePage({Key key}) : super(key: key);
  @override
  HomeListPage createState() => new HomeListPage();
}

class HomeListPage extends State<HomePage> implements PantryContract{
  PantryPresenter pantryPresenter;

  @override
  void initState(){
    super.initState();
    pantryPresenter = new PantryPresenter(this);
  }

  displayRecord() {
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
      ),
      body: new FutureBuilder<List<Pantry>>(
        future: pantryPresenter.getPantry(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            // print(snapshot.error);
          }
          var data = snapshot.data;
          return snapshot.hasData ? new PantryList(data, pantryPresenter) : new Center(child: new CircularProgressIndicator(),);
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddPantry,
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  Future _openAddPantry() async{
    showDialog(
      context: context,
      builder: (BuildContext context) => new AddPantryItem().buildPantryDialog(context, this, false, null),
    );

    setState(() {
      
    });
  }

  @override
  void screenUpdate() {
    setState(() {});
  }

}