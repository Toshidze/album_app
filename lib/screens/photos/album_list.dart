import 'package:app_for_trood/provider/data_provider.dart';
import 'package:app_for_trood/screens/photos/photo_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlbumList extends StatelessWidget {
  final int? lengthList;
  final int? userId;
  final int? cIndex;
  final Iterable<dynamic>? boxAlbum;
  const AlbumList({
    Key? key,
    this.lengthList,
    this.userId,
    this.boxAlbum,
    this.cIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = context.watch<GetData>();
    return FutureBuilder(
      future: data.photoInfoList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var userData = data.albumModel
              .where((element) => element.userId == userId)
              .toList();
          return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.6)),
              itemCount: lengthList ?? data.albumModel.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhotoScreen(index: index),
                        ));
                  },
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 8,
                                offset: const Offset(0, 2))
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            '${lengthList != null ? userData[cIndex ?? index].firstPhoto : data.albumModel[cIndex ?? index].firstPhoto}',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Center(
                          child: Text(
                            lengthList != null
                                ? userData[cIndex ?? index].title
                                : data.albumModel[cIndex ?? index].title,
                            maxLines: 1,
                            style: const TextStyle(fontSize: 8),
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

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
