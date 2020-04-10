import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget{
  SettingsPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget>createState(){
    
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  bool isSwitchedStore = false;
  bool isSwitchedInventory = false;
  bool isSwitchedExpire = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Settings"),
      ),
      body: Container(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Notifications',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Card(
              child: SwitchListTile(
                title: Text(
                  'Notify me when close to a store:',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  'Requires GPS permissions enable.',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                value: isSwitchedStore,
                onChanged: (value){
                  setState(() {
                    isSwitchedStore = value;
                  });
                }, 
                activeColor: Colors.green,
                secondary: Icon(Icons.shopping_cart),
              ),
            ),
            Card(
              child: SwitchListTile(
                title: Text(
                  'Update inventory reminder:',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  'The remainder is set to happen at 8:00 PM everyday.',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                value: isSwitchedInventory,
                onChanged: (value){
                  setState(() {
                    isSwitchedInventory = value;
                  });
                }, 
                activeColor: Colors.green,
                secondary: Icon(Icons.access_time),
              ),
            ),
            Card(
              child: SwitchListTile(
                title: Text(
                  'Items about the expire.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  'You will receive a remainder if there are items closer to 3 days of their expiration date.',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                value: isSwitchedExpire,
                onChanged: (value){
                  setState(() {
                    isSwitchedExpire = value;
                  });
                }, 
                activeColor: Colors.green,
                secondary: Icon(Icons.access_time),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}