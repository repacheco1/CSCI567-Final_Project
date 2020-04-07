import 'package:flutter/material.dart';
import 'package:foodfficient/widgets/addShopping.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
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
                RaisedButton(
                  child: Text(
                      'Edit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  // child: Icon(Icons.edit),
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


