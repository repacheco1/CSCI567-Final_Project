import 'package:flutter/material.dart';
import 'package:foodfficient/models/shoppingHelper.dart';
import 'package:foodfficient/models/shoppingModel.dart';
import 'package:foodfficient/widgets/addShopping.dart';
import 'package:sqflite/sqlite_api.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key key}) : super(key: key);
  final ShoppingHelper _shoppingHelper = ShoppingHelper();
  List<ShoppingList> results;
  
  @override
  Widget build(BuildContext context) {
    if(){

    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Shopping List"),
      ),
      body: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.local_grocery_store),
              title: Text(
                'Milk',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                'Notes: Needed for cereal.',
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
      // body: ListView.builder(itemBuilder: (context, index) {
      //   return ListTile(
      //     title: Text('Lorem Ipsum'),
      //     subtitle: Text('$index'),
      //   );
      // }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addShoppingItem(context);
          // Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}


