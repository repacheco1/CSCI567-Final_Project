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
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          title: Text('Lorem Ipsum'),
          subtitle: Text('$index'),
        );
      }),
    );
  }
}