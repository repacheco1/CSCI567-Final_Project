import 'package:flutter/material.dart';

void addShoppingItem(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            height: 180,
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
                          child: Text('Save',
                          style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          onPressed: (){
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
