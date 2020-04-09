import 'package:foodfficient/models/pantryHelper.dart';
import 'package:foodfficient/models/pantryModel.dart';

abstract class PantryContract{
  void screenUpdate();
}

class PantryPresenter{
  PantryContract _view;
  var pdb = new PantryHelper();
  PantryPresenter(this._view);

  delete(Pantry pantry){
    var pdb = new PantryHelper();
    pdb.deletePantryItem(pantry);
    updateScreen();
  }

  Future<List<Pantry>> getPantry(){
    return pdb.getPantryDate();
  }
  
  updateScreen(){
    _view.screenUpdate();
  }
}