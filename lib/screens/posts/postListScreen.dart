import 'package:app_for_trood/repositories/post_repo.dart';
import 'package:app_for_trood/screens/posts/post_screen.dart';
import 'package:app_for_trood/utilities/constants.dart';
import 'package:app_for_trood/utilities/mainColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = context.watch<PostRepo>();
    return Container(
      child: FutureBuilder<dynamic>(
        future: data.fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            var ssData = snapshot.data;
            return Scaffold(
              backgroundColor: Colors.blueGrey[800],
              appBar: AppBar(
                backgroundColor: MainColor.mainColorGrey,
                title: Text('Posts'),
              ),
              body: ListView.builder(
                itemCount: ssData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 5,
                              offset: Offset(0, 2))
                        ],
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(5),
                        color: MainColor.mainColorGrey,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(5),
                          splashColor:
                              MainColor.mainAccentColorYelow.withOpacity(0.1),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return PostScreen(
                                  postItem: ssData[index],
                                );
                              },
                            ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ssData[index].user.name,
                                          style: kTitleTextStyle,
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5),
                                              child: Container(
                                                width: 260,
                                                child: Text(
                                                  ssData[index].title,
                                                  maxLines: 1,
                                                  style: kSubTitleTextStyle,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  color: MainColor.mainAccentColorYelow,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
      ),
    );
  }
}
