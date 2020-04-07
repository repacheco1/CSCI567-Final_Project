import 'package:flutter/material.dart';
import 'package:foodfficient/models/shoppingModel.dart';
// import 'package:foodfficient/screens/shopping.dart';
import 'package:foodfficient/models/shoppingHelper.dart';

// ShoppingDetails(this.name, this.notes);


void addShoppingItem(BuildContext context) async {
  // final _formKey = GlobalKey();
  ShoppingHelper shoppingHelper = ShoppingHelper();
  TextEditingController nameController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  ShoppingList item;
  // bool validate = false;

  // void updateName(){
  //   item.name = nameController.text;
  // }

	// // Update the description of todo object
	// void updateNotes() {
	// 	item.notes = notesController.text;
	// }

  void _showAlertDialog(String title, String message) {

    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );
  }

  void _save() async {
		int result;
		if (item.id != null) {  // Case 1: Update operation
			result = await shoppingHelper.updateShoppingItem(item);
		} else { // Case 2: Insert Operation
			result = await shoppingHelper.insertShoppingItem(item);
		}

		if (result != 0) {  // Success
			_showAlertDialog('Status', 'Item Saved Successfully');
		} else {  // Failure
			_showAlertDialog('Status', 'Problem Saving Item');
		}
	}
  // nameController.text = item.name;
  // notesController.text = item.notes;

  await showDialog(
    
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        // key: _formKey,
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
                    'Add Item',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                new Expanded(
                  child: new TextField(
                    controller: nameController,
                    autofocus: true,
                    decoration: new InputDecoration(
                      labelText: 'Item Name:', 
                      hintText: 'eg. Avocado'
                    ),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    onChanged: (value){
                      // updateName();
                    },
                  ),
                ),
                new Expanded(
                  child: new TextField(
                    controller: notesController,
                    autofocus: true,
                    decoration: new InputDecoration(
                      labelText: 'Item Notes:', 
                      hintText: 'eg. To make avocado toast.',
                      // errorText: validate ? 'Field cannot be empty.' : null,
                    ),
                    style: TextStyle(
                      fontSize: 16,
                    ),
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
                          _save();
                          // nameController.text.isEmpty ? validate  = true : validate = false;
                          // ShoppingFunctions().createItem(nameController.text, notesController.text);
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
  );
}
