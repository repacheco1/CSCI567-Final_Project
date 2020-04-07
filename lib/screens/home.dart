import 'package:flutter/material.dart';
import 'package:foodfficient/widgets/addItem.dart';

class HomePage extends StatefulWidget{
  HomePage({Key key}) : super(key: key);
  @override
  State<StatefulWidget>createState(){
    
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
      ),
      body: Card(
        child: Column(  
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.local_grocery_store),
              title: Text(
                'Milk 2 Gallons',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                'Exp. Date: April 17, 2020',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Icon(Icons.edit),
                  onPressed: () {/* ... */},
                ),
                FlatButton(
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                    ),
                  onPressed: () {/* ... */},
                ),
              ],
            ),
          ],
        ),
      ),
      // body: ListView.builder(itemBuilder: (context, index) {
      //   return ListTile(
      //     title: Text('Lorem Ipsum'),
      //     subtitle: Text('$index'),
      //   );
      // }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItem(context);
          // Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
