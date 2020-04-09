import 'dart:io' as io;
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:foodfficient/models/pantryModel.dart';

class PantryHelper{
  static final PantryHelper _pantryInstance = new PantryHelper.internal();
  factory PantryHelper() => _pantryInstance;
  static Database _pdb;

  Future<Database> get pdb async{
    if(_pdb != null){
      return _pdb;
    }
    _pdb = await initDb();

    return _pdb;
  }

  PantryHelper.internal();

  initDb() async{
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(
      documentsDirectory.path, 
      'pantry.db'
      );
    var shoppingDb = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate
    );

    return shoppingDb;
  }

  void _onCreate(Database pdb, int version) async{
    await pdb.execute(
      'CREATE TABLE Pantry(id INTEGER PRIMARY KEY, name TEXT, qtyType TEXT, expDate TEXT)'
    );
  }

  Future<int> savePantry(Pantry pantry) async{
    var dbClient = await pdb;
    int result = await dbClient.insert(
      'Pantry', 
      pantry.toMap()
    );

    return result;
  }

  Future<List<Pantry>> getPantry() async{
    var dbClient = await pdb;
    List<Map> list = await dbClient.rawQuery(
      'SELECT * FROM Pantry'
    );
    List<Pantry> shoppingItems = new List();
    for(int i = 0; i < list.length; i++){
      var item  = new Pantry(
        list[i]['name'],
        list[i]['qtyType'],
        list[i]['expDate']
      );
      item.setPantryId(list[i]['id']);
      shoppingItems.add(item);
    }

    return shoppingItems;
  }

  Future<List<Pantry>> getPantryAlpha() async{
    var dbClient = await pdb;
    List<Map> list = await dbClient.rawQuery(
      'SELECT * FROM Pantry ORDER BY name ASC'
    );
    List<Pantry> shoppingItems = new List();
    for(int i = 0; i < list.length; i++){
      var item  = new Pantry(
        list[i]['name'],
        list[i]['qtyType'],
        list[i]['expDate']
      );
      item.setPantryId(list[i]['id']);
      shoppingItems.add(item);
    }

    return shoppingItems;
  }

  Future<List<Pantry>> getPantryDate() async{
    var dbClient = await pdb;
    List<Map> list = await dbClient.rawQuery(
      'SELECT * FROM Pantry ORDER BY expDate, name'
    );
    List<Pantry> shoppingItems = new List();
    for(int i = 0; i < list.length; i++){
      var item  = new Pantry(
        list[i]['name'],
        list[i]['qtyType'],
        list[i]['expDate']
      );
      item.setPantryId(list[i]['id']);
      shoppingItems.add(item);
    }

    return shoppingItems;
  }

  Future<int> deletePantryItem(Pantry pantry) async{
    var dbClient = await pdb;
    int result = await dbClient.rawDelete(
      'DELETE FROM Pantry WHERE id = ?',
      [pantry.id]
    );

    return result;
  }

  Future<bool> update(Pantry pantry) async{
    var dbClient = await pdb;
    int result = await dbClient.update(
      'Pantry',
      pantry.toMap(),
      where: 'id = ?',
      whereArgs: <int>[pantry.id]
    );

    return result > 0 ? true : false;
  }
  
  Future close() async{
    var dbClient = await pdb;
    return dbClient.close();
  }
  
}