import 'package:app_for_trood/models/photoModel.dart';
import 'package:app_for_trood/services/networkingPhoto.dart';
import 'package:app_for_trood/utilities/mainColor.dart';
import 'package:flutter/material.dart';

class PhotoScreen extends StatelessWidget {
  PhotoScreen({Key? key, required this.idPhoto}) : super(key: key);
  final int idPhoto;
  // final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Photo>>(
        future: postId(idPhoto),
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

  Future<List<Photo>> postId(idPhoto) async {
    var pushID = await fetchPhotos(id);
    return pushID;
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({Key? key, required this.photos}) : super(key: key);

  final List<dynamic> photos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        backgroundColor: MainColor.mainColorGrey,
        title: Text(
          'Trood.',
        ),
      ),
      body: Container(
        child: GridView.builder(
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
        ),
      ),
    );
  }
}
