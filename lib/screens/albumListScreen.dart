import 'package:app_for_trood/resources/resources.dart';
import 'package:flutter/material.dart';

class AlbumListScreen extends StatelessWidget {
  const AlbumListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
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
                      child:
                          Image(image: AssetImage(AppImages.canadaLandscape))),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('data'),
              ],
            ),
          );
        });
  }
}
