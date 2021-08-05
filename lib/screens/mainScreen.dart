import 'package:flutter/material.dart';

import '../utilities/mainColor.dart';
import 'albumListScreen.dart';
import 'postListScreen.dart';
import 'userListScreen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: MainColor.mainAccentColorYelow,
        backgroundColor: MainColor.mainColorGrey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album),
            label: 'Albums',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add),
            label: 'Posts',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapped,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          UserListScreen(),
          AlbumListScreen(),
          PostListScreen(),
        ],
      ),
    );
  }
}
