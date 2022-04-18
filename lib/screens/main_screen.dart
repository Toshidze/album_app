import 'package:app_for_trood/screens/photos/album_list_screen.dart';
import 'package:app_for_trood/screens/posts/post_list_screen.dart';
import 'package:app_for_trood/screens/users/user_list_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.title}) : super(key: key);

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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
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
        children: const [
          UserListScreen(),
          AlbumListScreen(),
          PostListScreen(),
        ],
      ),
    );
  }
}
