import 'package:flutter/material.dart';
import 'package:foodfficient/models/shoppingFunctions.dart';

void addShoppingItem(BuildContext context) async {
  final _formKey = GlobalKey();
  TextEditingController itemController = new TextEditingController();
  TextEditingController notesController = new TextEditingController();
  bool validate = false;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          key: _formKey,
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
                      controller: itemController,
                      autofocus: true,
                      decoration: new InputDecoration(
                        labelText: 'Item Name:', 
                        hintText: 'eg. Avocado'
                      ),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new TextField(
                      controller: notesController,
                      autofocus: true,
                      decoration: new InputDecoration(
                        labelText: 'Item Notes:', 
                        hintText: 'eg. To make avocado toast.',
                        errorText: validate ? 'Field cannot be empty.' : null,
                      ),
                      style: TextStyle(
                        fontSize: 16,
                      ),
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
                            ShoppingFunctions().getAllShoppingItems();
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
                            itemController.text.isEmpty ? validate  = true : validate = false;
                            // ShoppingFunctions().createItem(itemController.text, notesController.text);
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
      });
  }
