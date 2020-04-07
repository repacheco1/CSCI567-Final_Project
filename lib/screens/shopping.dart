import 'package:flutter/material.dart';
import 'package:foodfficient/models/shoppingHelper.dart';
import 'package:foodfficient/models/shoppingModel.dart';
import 'package:foodfficient/widgets/addShopping.dart';
// import 'package:foodfficient/models/shoppingFunctions.dart';
import 'package:sqflite/sqflite.dart';

class ShoppingPage extends StatefulWidget{
  ShoppingPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget>createState(){
    return ShoppingListPage();
  }
}

class ShoppingListPage extends State<ShoppingPage> {
  ShoppingHelper shoppingHelper = ShoppingHelper();
  List<ShoppingList> shoppingMap;
  int count = 0;
  
  @override
  Widget build(BuildContext context) {
    if(shoppingMap == null){
      shoppingMap = List<ShoppingList>();
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Shopping List"),
      ),
      body: ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading:  Icon(Icons.local_grocery_store),
                  title: Text(this.shoppingMap[position].name,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(this.shoppingMap[position].notes,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Icon(Icons.edit),
                    onPressed: () {
                      // navigateToDetail(this, name)
                    },
                  ),
                  FlatButton(
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                      ),
                    onPressed: () {
                      _delete(context, shoppingMap[position]);
                    },
                  ),
                ],
              ),
              ],
            ),
          );
        },
      ),
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

  void updateListView() {
    final Future<Database> dbFuture = shoppingHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<ShoppingList>> shoppingListFuture = shoppingHelper.getShoppingList();
      shoppingListFuture.then((todoList) {
        setState(() {
          this.shoppingMap = todoList;
          this.count = todoList.length;
        });
      });
    });
  }

  void _delete(BuildContext context, ShoppingList item) async {
    int result = await shoppingHelper.deleteShoppingItem(item.id);
    if (result != 0) {
      _showSnackBar(context, 'Item Deleted Successfully.');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  //   void navigateToDetail(ShoppingList item, String name) async {
  //   bool result =
  //       await Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return shoppingMap(item, name);
  //   }));

  //   if (result == true) {
  //     updateListView();
  //   }
  // }

}