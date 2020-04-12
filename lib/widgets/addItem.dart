import 'package:flutter/material.dart';
import 'package:foodfficient/models/pantry/pantryModel.dart';
import 'package:foodfficient/models/pantry/pantryHelper.dart';
import 'package:foodfficient/widgets/customTextFormField.dart';
import 'package:foodfficient/widgets/datePicker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddPantryItem{
  final controllerName = TextEditingController();
  final controllerQtyType = TextEditingController();
  final controllerExpDate = TextEditingController();
  Pantry pantry;

  Widget buildPantryDialog(BuildContext context, _myPantryListPage, isEdit, Pantry pantry){
    if(pantry != null){
      this.pantry = pantry;
      controllerName.text = pantry.name;
      controllerQtyType.text = pantry.qtyType;
      controllerExpDate.text = pantry.expDate;
    }
    
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Container(
        height: 300,
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Center(
                child: Text(
                  isEdit ? 'Edit' : 'Add Item',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              // String label, String hint, TextEditingController input, bool isFocus
              customTextField(
                'Item Name:', 
                'eg. Milk', 
                controllerName, 
                true
              ),
              customTextField(
                'Item Quantity:', 
                'eg.2 Gallons', 
                controllerQtyType
              ),
              expDatePicker(context, controllerExpDate),
              ButtonTheme(
                child: ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      color: Colors.red,
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      splashColor: Colors.grey,
                    ),
                    RaisedButton(
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      onPressed: (){
                        addRecord(isEdit);
                        _myPantryListPage.displayRecord();
                        Navigator.pop(context);
                        Fluttertoast.showToast(
                          msg: '${controllerName.text} has been saved.'
                        );
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      splashColor: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future addRecord(bool isEdit) async {
    var pdb = new PantryHelper();
    var pantry = new Pantry(controllerName.text, controllerQtyType.text, controllerExpDate.text);
    if (isEdit) {
      pantry.setPantryId(this.pantry.id);
      await pdb.update(pantry);
    } else {
      await pdb.savePantry(pantry);
    }
  }

}
