import 'package:foodfficient/models/shopping/shoppingHelper.dart';
import 'package:foodfficient/models/shopping/shoppingModel.dart';

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
    return sdb.getShoppingAlpha();
  }
  
  updateScreen(){
    _view.screenUpdate();
  }
  
}