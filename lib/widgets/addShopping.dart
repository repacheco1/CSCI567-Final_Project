import 'package:flutter/material.dart';
import 'package:foodfficient/models/shopping/shoppingModel.dart';
import 'package:foodfficient/models/shopping/shoppingHelper.dart';
import 'package:foodfficient/widgets/customTextFormField.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddShoppingItem{
  final controllerName = TextEditingController();
  final controllerNotes = TextEditingController();
  Shopping shopping;

  Widget buildShoppingDialog(BuildContext context, _myShoppingListPage, isEdit, Shopping shopping){
    if(shopping != null){
      this.shopping = shopping;
      controllerName.text = shopping.name;
      controllerNotes.text = shopping.notes;
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Container(
        height: 220,
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
              customTextField(
                'Item Name:', 
                'eg. Avocado', 
                controllerName, 
                true
              ),
              customTextField(
                'Item Notes:', 
                'eg. To Make avocado toast', 
                controllerNotes
              ),
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
                        _myShoppingListPage.displayRecord();
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
    var sdb = new ShoppingHelper();
    var shopping = new Shopping(controllerName.text, controllerNotes.text);
    if (isEdit) {
      shopping.setShoppingId(this.shopping.id);
      await sdb.update(shopping);
    } else {
      await sdb.saveShopping(shopping);
    }
  }

}
