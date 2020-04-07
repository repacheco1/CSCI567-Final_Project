import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
import 'package:foodfficient/models/shoppingModel.dart';

class ShoppingHelper{
  static ShoppingHelper _shoppingHelper;
  static Database _shoppingDatabase; //shopping db

  final String tableShopping = 'shoppingTable';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnNotes = 'notes';

  ShoppingHelper._createInstance();

  factory ShoppingHelper(){
    if(_shoppingHelper == null){
      _shoppingHelper = ShoppingHelper._createInstance();
    }

    return _shoppingHelper;
  }

  Future<Database> get shoppingDatabase async{
    if(_shoppingDatabase == null){
      _shoppingDatabase = await initializeDatabase();
    }
    
    return _shoppingDatabase;
  }

  Future<Database> initializeDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'shopping.db';

    var shoppingDatabase = await openDatabase(
      path, 
      version: 1,
      onCreate: _createDB
    );

    return shoppingDatabase;
  }

  void _createDB(Database shoppingDB, int newVersion) async{
    await shoppingDB.execute(
      'CREATE TABLE $tableShopping($columnId INTEGER PRIMARY KEY, $columnName TEXT, $columnNotes TEXT)'
    );
  }

  Future<List<Map<String, dynamic>>> getShoppingMapList() async{
    Database shoppingDB = await this.shoppingDatabase;
    var result = await shoppingDB.query(tableShopping);

    return result;
  }

  Future<int> insertShoppingItem(ShoppingList shopping) async{
    Database shoppingDB = await this.shoppingDatabase;
    var result = await shoppingDB.insert(
      tableShopping, 
      shopping.toMap());

    return result;
  }

  Future<int> updateShoppingItem(ShoppingList shopping) async{
    var shoppingDB = await shoppingDatabase;
    var result = await shoppingDB.update(
      tableShopping,
      shopping.toMap(),
      where: '$columnId = ?',
      whereArgs: [shopping.id]
    );

    return result;
  }

  Future<int> deleteShoppingItem(int id) async{
    var shoppingDB = await shoppingDatabase;
    int result = await shoppingDB.rawDelete(
      'DELETE FROM $tableShopping WHERE $columnId = $id'
    );

    return result;
  }

  Future<int> getCount() async {
    Database shoppingDB = await this.shoppingDatabase;
    List<Map<String, dynamic>> x = await shoppingDB.rawQuery(
      'SELECT COUNT (*) from $tableShopping'
      );
    int result = Sqflite.firstIntValue(x);

    return result;
  }

  Future<List<ShoppingList>> getShoppingList() async{
    var shoppingMapList = await getShoppingMapList();
    int count = shoppingMapList.length;

    List<ShoppingList> shoppingMap = List<ShoppingList>();

    for(int i = 0; i < count; i++){
      shoppingMap.add(
        ShoppingList.fromMapObject(shoppingMapList[i]));
    }
    return shoppingMap;
  }
  //-----------------------------------------------
  // Future<List> getAllShoppingItems() async{
  //   var sdbClient = await shoppingDatabase;
  //   var result = await sdbClient.query(
  //     tableShopping, 
  //     columns: [columnId, columnName, columnNotes]);

  //   return result.toList();
  // }

  // Future<ShoppingList> getShoppingItem(int id) async {
  //   var sdbClient = await shoppingDatabase;
  //   List<Map> result = await sdbClient.query(
  //     tableShopping,
  //     columns: [columnId, columnName, columnNotes],
  //     where: '$columnId = ?',
  //     whereArgs: [id]
  //   );

  //   if(result.length > 0){
  //     return new ShoppingList.fromMap(result.first);
  //   }

  //   return null;
  // }
  //-------------------------------------------------
  Future close() async{
    var sdbClient = await shoppingDatabase;
    return sdbClient.close();
  }
}