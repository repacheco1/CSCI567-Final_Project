import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodfficient/models/shoppingModel.dart';
import 'package:foodfficient/models/shoppingHelper.dart';

class ShoppingFunctions{
  List shoppingItems;
  var sdb = ShoppingHelper();

  Future createItem(String name, String notes) async{
    var item = ShoppingList(name, notes);
    await sdb.saveShoppingItem(item);
    Fluttertoast.showToast(msg: 'Item has been saved.');
  }
  Future getAllShoppingItems() async{
    shoppingItems = await sdb.getAllShoppingItems();
    shoppingItems.forEach((shoppingItems) => print(shoppingItems));
  }

  Future updateShoppingItem(int id, String name, String notes) async{
    ShoppingList updateShoppingItem = ShoppingList.fromMap({
      'id': id,
      'name': name,
      'notes': notes
       });
    await sdb.updateShoppingItem(updateShoppingItem);
  }
  
  Future deleteShoppingItems(int id) async{
    await sdb.deleteShoppingItem(id);
    shoppingItems = await sdb.getAllShoppingItems();
    shoppingItems.forEach((shoppingItems) => print(shoppingItems));
  }
}