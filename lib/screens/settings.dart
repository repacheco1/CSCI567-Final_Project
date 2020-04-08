import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget{
  SettingsPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget>createState(){
    
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  bool isSwitched = false;

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
            Center(
              child: Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Divider(
              thickness: 5.0,
              color: Colors.transparent,
            ),
            SwitchListTile(
              title: Text(
                'Notify me when close to a store:',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              value: isSwitched,
              onChanged: (value){
                setState(() {
                  isSwitched = value;
                });
              }, 
              activeColor: Colors.green,
              secondary: Icon(Icons.shopping_cart),
            ),
          ],
        ),
      ),
    );
  }
}