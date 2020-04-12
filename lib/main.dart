import 'package:flutter/material.dart';
import 'package:foodfficient/widgets/bottomBar.dart';
// import 'package:foodfficient/utils/serviceLocator.dart';
// import 'package:foodfficient/utils/fingerprintAuth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //  final LocalAuthenticationService _localAuth = locator<LocalAuthenticationService>();

  @override
  Widget build(BuildContext context) {
    // _localAuth.authenticate();
    return MaterialApp(
      // title: 'Foodfficient',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BottomBar(),
    );
  }
  
}