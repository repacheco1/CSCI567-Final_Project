import 'package:flutter/material.dart';
import 'package:foodfficient/addShopping.dart';

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
          addShoppingItem(context);
          // Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}


