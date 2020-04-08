import 'dart:io' as io;
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:foodfficient/models/shoppingModel.dart';

class ShoppingHelper{
  static final ShoppingHelper _shoppingInstance = new ShoppingHelper.internal();
  factory ShoppingHelper() => _shoppingInstance;
  static Database _sdb;

  Future<Database> get sdb async{
    if(_sdb != null){
      return _sdb;
    }
    _sdb = await initDb();

    return _sdb;
  }

  ShoppingHelper.internal();

  initDb() async{
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(
      documentsDirectory.path, 
      'shopping.db'
      );
    var shoppingDb = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate
    );

    return shoppingDb;
  }

  void _onCreate(Database sdb, int version) async{
    await sdb.execute(
      'CREATE TABLE Shopping(id INTEGER PRIMARY KEY, name TEXT, notes TEXT)'
    );
  }

  Future<int> saveShopping(Shopping shopping) async{
    var dbClient = await sdb;
    int result = await dbClient.insert(
      'Shopping', 
      shopping.toMap()
    );

    return result;
  }

  Future<List<Shopping>> getShopping() async{
    var dbClient = await sdb;
    List<Map> list = await dbClient.rawQuery(
      'SELECT * FROM Shopping'
    );
    List<Shopping> shoppingItems = new List();
    for(int i = 0; i < list.length; i++){
      var item  = new Shopping(
        list[i]['name'], 
        list[i]['notes']
      );
      item.setShoppingId(list[i]['id']);
      shoppingItems.add(item);
    }
    // print(shoppingItems.length); //delete this?

    return shoppingItems;
  }

  Future<int> deleteShoppingItem(Shopping shopping) async{
    var dbClient = await sdb;
    int result = await dbClient.rawDelete(
      'DELETE FROM Shopping WHERE id = ?',
      [shopping.id]
    );

    return result;
  }

  Future<bool> update(Shopping shopping) async{
    var dbClient = await sdb;
    int result = await dbClient.update(
      'Shopping',
      shopping.toMap(),
      where: 'id = ?',
      whereArgs: <int>[shopping.id]
    );

    return result > 0 ? true : false;
  }
  
  Future close() async{
    var dbClient = await sdb;
    return dbClient.close();
  }
}