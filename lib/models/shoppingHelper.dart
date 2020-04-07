import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:foodfficient/models/shoppingModel.dart';

class ShoppingHelper{
  static final ShoppingHelper _instance = ShoppingHelper.internal();
  factory ShoppingHelper() => _instance;

  final String tableShopping = 'shoppingTable';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnNotes = 'notes';

  static Database _sdb; //shopping db
  ShoppingHelper.internal();

  Future<Database> get sdb async{
    if(_sdb != null){
      return _sdb;
    }
    _sdb = await initDb();
    
    return _sdb;
  }

  initDb() async{
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'shopping.db');

    await deleteDatabase(path);

    var sdb = await openDatabase(
      path, 
      version: 1,
      onCreate: _onCreate
    );

    return sdb;
  }

  void _onCreate(Database sdb, int newVersion) async{
    await sdb.execute(
      'CREATE TABLE $tableShopping($columnId INTEGER PRIMARY KEY, $columnName TEXT, $columnNotes TEXT)'
    );
  }

  Future<int> saveShoppingItem(ShoppingList shopping) async{
    var sdbClient = await sdb;
    var result = await sdbClient.insert(
      tableShopping, 
      shopping.toMap());

    return result;
  }

  Future<List> getAllShoppingItems() async{
    var sdbClient = await sdb;
    var result = await sdbClient.query(
      tableShopping, 
      columns: [columnId, columnName, columnNotes]);

    return result.toList();
  }

  Future<int> getCount() async {
    var sdbClient = await sdb;
    return Sqflite.firstIntValue(await sdbClient.rawQuery(
      'SELECT COUNT (*) from $tableShopping'
      )
    );
  }

  Future<ShoppingList> getShoppingItem(int id) async {
    var sdbClient = await sdb;
    List<Map> result = await sdbClient.query(
      tableShopping,
      columns: [columnId, columnName, columnNotes],
      where: '$columnId = ?',
      whereArgs: [id]
    );

    if(result.length > 0){
      return new ShoppingList.fromMap(result.first);
    }

    return null;
  }

  Future<int> deleteShoppingItem(int id) async{
    var sdbClient = await sdb;
    return await sdbClient.delete(
      tableShopping,
      where: '$columnId = ?',
      whereArgs: [id]
    );
  }

  Future<int> updateShoppingItem(ShoppingList shopping) async{
    var sdbClient = await sdb;
    return await sdbClient.update(
      tableShopping, 
      shopping.toMap(),
      where: '$columnId = ?',
      whereArgs: [shopping.id]
    );
  }

  Future close() async{
    var sdbClient = await sdb;
    return sdbClient.close();
  }
}