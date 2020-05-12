import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:geolocator/geolocator.dart';

class SettingsPage extends StatefulWidget{
  SettingsPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget>createState(){
    
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  Position _position;
  String _placemark;
  String _debugLabelString = "";
  String _emailAddress;
  String _externalUserId;
  bool _enableConsentButton = false;

  // CHANGE THIS parameter to true if you want to test GDPR privacy consent
  bool _requireConsent = true;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    getLocation();
  }

  void getLocation() async {
    _position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    List<Placemark> placemark = await Geolocator().placemarkFromPosition(_position);
    }

  
  bool isSwitchedStore = false;
  bool isSwitchedInventory = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Settings"),
      ),
      body: Container(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Notifications',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Card(
              child: SwitchListTile(
                title: Text(
                  'Notify me when close to a store:',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  'Requires GPS permissions enable.',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                value: isSwitchedStore,
                onChanged: (value){
                  setState(() {
                    isSwitchedStore = value;
                    // switchActions();
                  });
                }, 
                activeColor: Colors.green,
                secondary: Icon(Icons.shopping_cart),
              ),
            ),
            Card(
              child: SwitchListTile(
                title: Text(
                  'Update inventory reminder:',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  'The remainder is set to happen at 8:00 PM everyday.',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                value: isSwitchedInventory,
                onChanged: (value){
                  setState(() {
                    isSwitchedInventory = value;
                  });
                }, 
                activeColor: Colors.green,
                secondary: Icon(Icons.access_time),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> initPlatformState() async {
    //Remove this method to stop OneSignal Debugging 
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.init(
      "bea60737-8940-4193-99bf-159bbf043fde",
      // iOSSettings: {
      //   OSiOSSettings.autoPrompt: false,
      //   OSiOSSettings.inAppLaunchUrl: false
      // }
    );
    OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);

    // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    await OneSignal.shared.promptUserForPushNotificationPermission(fallbackToSettings: true);
    
    OneSignal.shared.setNotificationReceivedHandler((OSNotification notification) {
    // will be called whenever a notification is received
    });

    OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // will be called whenever a notification is opened/button pressed.
    });

    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
        // will be called whenever the permission changes
        // (ie. user taps Allow on the permission prompt in iOS)
    });

    OneSignal.shared.setSubscriptionObserver((OSSubscriptionStateChanges changes) {
        // will be called whenever the subscription changes 
        //(ie. user gets registered with OneSignal and gets a user ID)
    });

    OneSignal.shared.setLocationShared(true);

    OneSignal.shared.setEmailSubscriptionObserver((OSEmailSubscriptionStateChanges emailChanges) {
        // will be called whenever then user's email subscription changes
        // (ie. OneSignal.setEmail(email) is called and the user gets registered
    });

    // For each of the above functions, you can also pass in a 
    // reference to a function as well:

    void _handleNotificationReceived(OSNotification notification) {
      
    }
    OneSignal.shared.setNotificationReceivedHandler(_handleNotificationReceived);
  }
  
}