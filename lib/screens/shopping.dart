import 'package:flutter/material.dart';
import 'package:foodfficient/models/shoppingFunctions.dart';
import 'package:foodfficient/models/shoppingModel.dart';
import 'package:foodfficient/utils/shoppingListView.dart';
import 'package:foodfficient/widgets/addShopping.dart';

class ShoppingPage extends StatefulWidget{
  ShoppingPage({Key key}) : super(key: key);
  @override
  ShoppingListPage createState() => new ShoppingListPage();
  // State<StatefulWidget>createState(){
  //   return ShoppingListPage();
  // }
}

class ShoppingListPage extends State<ShoppingPage> implements ShoppingContract{
  ShoppingPresenter shoppingPresenter;

  @override
  void initState(){
    super.initState();
    shoppingPresenter = new ShoppingPresenter(this);
  }

  displayRecord() {
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Shopping List"),
      ),
      body: new FutureBuilder<List<Shopping>>(
        future: shoppingPresenter.getShopping(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            print(snapshot.error);
          }
          var data = snapshot.data;
          return snapshot.hasData ? new ShoppingList(data, shoppingPresenter) : new Center(child: new CircularProgressIndicator(),);
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddShopping,
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  Future _openAddShopping() async{
    showDialog(
      context: context,
      builder: (BuildContext context) => new AddShoppingItem().buildShoppingDialog(context, this, false, null),
    );

    setState(() {
      
    });
  }

  @override
  void screenUpdate() {
    setState(() {});
  }

}