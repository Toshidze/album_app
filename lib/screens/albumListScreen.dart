import 'dart:async';
import 'package:app_for_trood/services/networkingAlbum.dart';
import 'package:app_for_trood/utilities/mainColor.dart';
import 'package:flutter/material.dart';
import 'photoScreen.dart';

class AlbumListScreen extends StatefulWidget {
  const AlbumListScreen({Key? key}) : super(key: key);

  @override
  _AlbumListScreenState createState() => _AlbumListScreenState();
}

class _AlbumListScreenState extends State<AlbumListScreen> {
  List<dynamic> albumModel = [];
  List<dynamic> photos = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: userInfoList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                ),
                itemCount: albumModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PhotoScreen(idPhoto: albumModel[index].id),
                          ));
                    },
                    child: Column(
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
                                child: Image.network(
                                    albumModel[index].firstPhoto))),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 130,
                          child: Center(
                            child: Text(
                              albumModel[index].title,
                              maxLines: 1,
                              style: TextStyle(fontSize: 8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future<List> userInfoList() async {
    albumModel = await AlbumClass().fetchAlbum();
    return albumModel;
  }
}
