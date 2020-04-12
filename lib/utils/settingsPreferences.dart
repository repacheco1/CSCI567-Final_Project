// import 'package:flutter/material.dart';
// import 'package:foodfficient/utils/preferencesHelper.dart';

// class Prefs {
//   static Future<String> get tutorialString => PreferencesHelper.getString(Const.NAME_STRING);
//   static Future setNameString(String value) => PreferencesHelper.setString(Const.NAME_STRING, value);

//   static Future<bool> get authenticated => PreferencesHelper.getBool(Const.AUTHENTICATED);
//   static Future setAuthenticated(bool value) => PreferencesHelper.setBool(Const.AUTHENTICATED, value);
  

//   // static Future<String> get passcode => PreferencesHelper.getString(Const.PASSODE);
//   // static Future setPasscode(String value) => PreferencesHelper.setString(Const.PASSODE, value);

//   static Future<void> clear() async {
//     await Future.wait(<Future>[
//       setNameString(''),
//       setAuthenticated(false),
//       // setNameString(''),
//       // setPasscode(''),
//     ]);
//   }
// }

// class Const {
//   static const String NAME_STRING = 'NAME_STRING';

//   // Default preferences
//   static const String AUTHENTICATED = 'AUTHENTICATED';
//   // static const String PASSODE = 'PASSCODE';
//   static const String FINGERPRINT_ENABLED = 'FINGERPRINT_ENABLED';
// }