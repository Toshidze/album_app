import 'package:app_for_trood/models/photo_model.dart';
import 'package:app_for_trood/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    var data = context.watch<GetData>();
    return FutureBuilder<List<Photo>>(
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
              title: const Text(
                'Photos',
              ),
            ),
            body: GridView.builder(
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
                            offset: const Offset(0, 2))
                      ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(ssData![index].thumbnailUrl),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 130,
                      child: Center(
                        child: Text(
                          ssData[index].title,
                          maxLines: 2,
                          style: const TextStyle(fontSize: 8),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
