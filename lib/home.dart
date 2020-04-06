import 'package:flutter/material.dart';
import 'package:foodfficient/widget.dart';
import 'package:foodfficient/datePicker.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
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
      //  builder: (_) =>  new SystemPadding(child: new AlertDialog(
        builder: (_) =>  new SystemPadding(child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Expanded(
              child: new TextField(
                autofocus: true,
                decoration: new InputDecoration(
                  labelText: 'Item Name:', 
                  hintText: 'eg. Avocado'),
              ),
            ),
            SizedBox(height: 10.0,),
            new Expanded(
              child: new TextField(
                decoration: new InputDecoration(
                  labelText: 'Item Qty:',
                  hintText: 'eg. 2',
                ),
              ),
            ),
            SizedBox(width: 10.0,),
            new Expanded(
              child: new TextField(
                decoration: new InputDecoration(
                  labelText: 'Qty Type:',
                  hintText: 'eg. pieces',
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            ExpirationDateField(),
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