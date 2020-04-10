import 'package:flutter/material.dart';
import 'package:foodfficient/models/shopping/shoppingFunctions.dart';
import 'package:foodfficient/models/shopping/shoppingModel.dart';
import 'package:foodfficient/widgets/addShopping.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShoppingList extends StatelessWidget{
  final List<Shopping> basket;
  final ShoppingPresenter shoppingPresenter;

  ShoppingList(
    this.basket,
    this.shoppingPresenter,
    {Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: basket == null ? 0 : basket.length,
      itemBuilder: (BuildContext context, int index){
        return new Card(
          child:  new Container(
            child: new Center(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25.0,
                      child: new Text(
                        getShortName(basket[index]),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      backgroundColor: Colors.teal,
                    ),
                    title: Text(
                      basket[index].name,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      basket[index].notes, //modify this function if cards are broken
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.orange,
                            ),
                          onPressed: () => edit(basket[index], context),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                            ),
                          onPressed: (){
                            showDialog(
                              context: context,
                              builder:(BuildContext context){
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)
                                  ),
                                  title: Text(
                                    'Delete from shopping list?',
                                  ),
                                  content: Text(
                                    'This will delete "${basket[index].name.toLowerCase()}" from your shopping list.'
                                  ),
                                  actions: <Widget>[
                                    RaisedButton(
                                      child: Text(
                                        'Cancel'
                                      ),
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      color: Colors.blueGrey,
                                      textColor: Colors.white,
                                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      splashColor: Colors.grey,
                                    ),
                                    SizedBox(width: 5),
                                    RaisedButton(
                                      child: Text(
                                        'Delete'
                                      ),
                                      onPressed: (){
                                        shoppingPresenter.delete(basket[index]);
                                        Navigator.pop(context);
                                        Fluttertoast.showToast(
                                          msg: '${basket[index].name} has been deleted.'
                                        );
                                      },
                                      color: Colors.red,
                                      textColor: Colors.white,
                                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      splashColor: Colors.grey,
                                    ),
                                    SizedBox(width: 5),
                                  ],
                                );
                              }
                            );
                          },
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

  displayRecord() {
    shoppingPresenter.updateScreen();
  }

  edit(Shopping shopping, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          new AddShoppingItem().buildShoppingDialog(context, this, true, shopping),
    );
    shoppingPresenter.updateScreen();
  }

  String getShortName(Shopping shopping) {
    String shortName = "";
    if (shopping.name.isNotEmpty) {
      shortName = shopping.name.substring(0, 1);
    }
    return shortName;
  }
  
}

