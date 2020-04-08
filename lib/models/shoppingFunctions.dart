// import 'package:flutter/material.dart';
import 'package:foodfficient/models/shoppingHelper.dart';
import 'package:foodfficient/models/shoppingModel.dart';
// import 'package:foodfficient/widgets/addShopping.dart';
// import 'package:sqflite/sqflite.dart';

abstract class ShoppingContract{
    void screenUpdate();
}

class ShoppingPresenter{
  ShoppingContract _view;
  var sdb = new ShoppingHelper();
  ShoppingPresenter(this._view);

  delete(Shopping shopping){
    var sdb = new ShoppingHelper();
    sdb.deleteShoppingItem(shopping);
    updateScreen();
  }

  Future<List<Shopping>> getShopping(){
    return sdb.getShopping();
  }
  updateScreen(){
    _view.screenUpdate();
  }
}