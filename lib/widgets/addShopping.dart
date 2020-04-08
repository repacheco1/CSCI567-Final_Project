import 'package:flutter/material.dart';
import 'package:foodfficient/models/shoppingModel.dart';
// import 'package:foodfficient/screens/shopping.dart';
import 'package:foodfficient/models/shoppingHelper.dart';
// import 'package:foodfficient/screens/shopping.dart';
// import 'package:foodfficient/models/shoppingFunctions.dart';
// import 'package:foodfficient/widgets/addItem.dart';
// import 'package:foodfficient/models/shoppingFunctions.dart';

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
        borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        height: 220,
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
              new Expanded(
                child: new TextFormField(
                  autofocus: true,
                  decoration: new InputDecoration(
                    labelText: 'Item Name:', 
                    hintText: 'eg. Avocado'
                  ),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  controller: controllerName,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter the name of the item.';
                    }
                    return null;
                  },
                  onChanged: (value){
                  },
                ),
              ),
              new Expanded(
                child: new TextFormField(
                  autofocus: true,
                  decoration: new InputDecoration(
                    labelText: 'Item Notes:', 
                    hintText: 'eg. To make avocado toast.',
                    // errorText: validate ? 'Field cannot be empty.' : null,
                  ),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  controller: controllerNotes,
                  onChanged: (value){
                    // updateNotes();
                  },
                ),
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


// void addShoppingItem(BuildContext context) async {
//   await showDialog(
    
//     context: context,
//     builder: (BuildContext context) {
//       return Dialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.0)),
//         child: Container(
//           height: 220,
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 new Center(
//                   child: Text(
//                     'Add Item',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//                 new Expanded(
//                   child: new TextFormField(
//                     autofocus: true,
//                     decoration: new InputDecoration(
//                       labelText: 'Item Name:', 
//                       hintText: 'eg. Avocado'
//                     ),
//                     style: TextStyle(
//                       fontSize: 16,
//                     ),
//                     validator: (value) {
//                       if (value.isEmpty) {
//                         return 'Please enter the name of the item.';
//                       }
//                       return null;
//                     },
//                     onChanged: (value){
//                     },
//                   ),
//                 ),
//                 new Expanded(
//                   child: new TextFormField(
//                     autofocus: true,
//                     decoration: new InputDecoration(
//                       labelText: 'Item Notes:', 
//                       hintText: 'eg. To make avocado toast.',
//                       // errorText: validate ? 'Field cannot be empty.' : null,
//                     ),
//                     style: TextStyle(
//                       fontSize: 16,
//                     ),
//                     onChanged: (value){
//                       // updateNotes();
//                     },
//                   ),
//                 ),
//                 ButtonTheme(
//                   child: ButtonBar(
//                     alignment: MainAxisAlignment.center,
//                     children: [
//                       RaisedButton(
//                         child: Text(
//                           'Cancel',
//                           style: TextStyle(
//                             fontSize: 16,
//                           ),
//                         ),
//                         onPressed: (){
//                           Navigator.pop(context);
//                         },
//                         color: Colors.red,
//                         textColor: Colors.white,
//                         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                         splashColor: Colors.grey,
//                       ),
//                       RaisedButton(
//                         child: Text(
//                           'Save',
//                           style: TextStyle(
//                             fontSize: 16,
//                           ),
//                         ),
//                         onPressed: (){
//                           Navigator.pop(context);
//                         },
//                         color: Colors.blue,
//                         textColor: Colors.white,
//                         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                         splashColor: Colors.grey,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//   );
// }
