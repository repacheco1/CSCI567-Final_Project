import 'package:flutter/material.dart';
import 'package:foodfficient/widget.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Shopping List"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          title: Text('Lorem Ipsum'),
          subtitle: Text('$index'),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog(context);
          // Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  _showDialog(BuildContext context) async {
    await showDialog<String>(
      context: context,
       builder: (_) =>  new SystemPadding(child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: new Row(
          children: <Widget>[
            new Expanded(
              child: new TextField(
                autofocus: true,
                decoration: new InputDecoration(
                  labelText: 'Item Name', 
                  hintText: 'eg. Avocado'),
              ),
            )
          ],
        ),
        actions: <Widget>[
          new FlatButton(
              child: const Text('Cancel'),
              textColor: Colors.red,
              onPressed: () {
                Navigator.pop(context);
              }),
          new FlatButton(
              child: const Text('Save'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      ),
    );
  }

}


