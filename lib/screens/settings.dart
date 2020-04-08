import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget{
  SettingsPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget>createState(){
    
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Settings"),
      ),
      body: Card(
        child: Column(  
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.local_grocery_store),
              title: Text(
                'Milk 2 Gallons',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                'Exp. Date: April 17, 2020',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Icon(Icons.edit),
                  onPressed: () {/* ... */},
                ),
                FlatButton(
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                    ),
                  onPressed: () {/* ... */},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}