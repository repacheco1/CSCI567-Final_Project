import 'package:flutter/material.dart';
import 'package:foodfficient/screens/home.dart';
import 'package:foodfficient/screens/shopping.dart';
import 'package:foodfficient/screens/settings.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBar createState() =>
      _BottomBar();
}

class _BottomBar
    extends State<BottomBar> {
  final List<Widget> pages = [
    HomePage(
      key: PageStorageKey('HomePage'),
    ),
    ShoppingPage(
      key: PageStorageKey('ShoppingPage'),
    ),
    SettingsPage(
      key: PageStorageKey('SettingsPage'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), 
              title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket), 
              title: Text('Shopping')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), 
              title: Text('Settings')),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}
