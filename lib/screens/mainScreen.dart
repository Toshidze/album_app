import 'package:app_for_trood/models/providerModel.dart';
import 'package:app_for_trood/screens/albumListScreen.dart';
import 'package:app_for_trood/screens/mainScreenModel.dart';
import 'package:app_for_trood/screens/postListScreen.dart';
import 'package:app_for_trood/screens/userListScreen.dart';
import 'package:app_for_trood/utilities/mainColor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

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
    // final model = ProviderModel.read<WidgetModel>(context);
    // print(model);
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        backgroundColor: MainColor.mainColorGrey,
        title: Text('Trood.'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: MainColor.mainAccentColorYelow,
        backgroundColor: MainColor.mainColorGrey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
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
          // ProviderModel(model: widgetModel, child: UserListScreen()),
          UserListScreen(),
          AlbumListScreen(),
          const PostListScreen(),
        ],
      ),
    );
  }
}

class AlbumListScreen extends StatelessWidget {
  AlbumListScreen({Key? key}) : super(key: key);

  // final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({Key? key, required this.photos}) : super(key: key);

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 8,
                    offset: Offset(0, 2))
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(photos[index].thumbnailUrl),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 130,
              child: Center(
                child: Text(
                  '${photos[index].title}',
                  maxLines: 2,
                  style: TextStyle(fontSize: 8),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
