import 'package:app_for_trood/models/photoModel.dart';
import 'package:app_for_trood/provider/data_provider.dart';
import 'package:app_for_trood/utilities/mainColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotoScreen extends StatelessWidget {
  PhotoScreen({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    var data = context.watch<GetData>();
    return Container(
      child: FutureBuilder<List<Photo>>(
        future: data.postId(data.albumModel[index].id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            final ssData = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Photos',
                ),
              ),
              body: Container(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: ssData?.length,
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
                            child: Image.network(ssData![index].thumbnailUrl),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 130,
                          child: Center(
                            child: Text(
                              '${ssData[index].title}',
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
