// import 'package:flutter/material.dart';
// import 'package:foodfficient/models/shoppingHelper.dart';
// import 'package:foodfficient/models/shoppingModel.dart';
// import 'package:foodfficient/widgets/addShopping.dart';
// import 'package:sqflite/sqflite.dart';

// ShoppingHelper databaseHelper = ShoppingHelper();


// void _delete(BuildContext context, ShoppingList item) async {
//   int result = await databaseHelper.deleteShoppingItem(item.id);
//   if (result != 0) {
//     _showSnackBar(context, 'Item Deleted Successfully.');
//     updateListView();
//   }
// }

// void _showSnackBar(BuildContext context, String message) {
//   final snackBar = SnackBar(content: Text(message));
//   Scaffold.of(context).showSnackBar(snackBar);
// }

// // void navigateToDetail(ShoppingList item, String title) async {
// //   bool result =
// //       await Navigator.push(context, MaterialPageRoute(builder: (context) {
// //     return TodoDetail(item, title);
// //   }));

// //   if (result == true) {
// //     updateListView();
// //   }
// // }

