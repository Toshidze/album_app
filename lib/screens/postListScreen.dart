import 'package:app_for_trood/screens/postScreen.dart';
import 'package:app_for_trood/services/networkingUsers.dart';
import 'package:app_for_trood/utilities/constants.dart';
import 'package:app_for_trood/utilities/mainColor.dart';
import 'package:flutter/material.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({Key? key}) : super(key: key);

  // final String title;z
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<dynamic>(
        future: ApiHelper().fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PostList(post: snapshot.data!);
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

class PostList extends StatefulWidget {
  const PostList({Key? key, required this.post}) : super(key: key);

  final List<dynamic> post;

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  void setState(VoidCallback fn) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        backgroundColor: MainColor.mainColorGrey,
        title: Text('Trood.'),
      ),
      body: ListView.builder(
        itemCount: widget.post.length,
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
                  splashColor: MainColor.mainAccentColorYelow.withOpacity(0.1),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return PostScreen(
                          postItem: widget.post[index],
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.post[index].user.name,
                                  style: kTitleTextStyle,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Container(
                                        width: 260,
                                        child: Text(
                                          widget.post[index].title,
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
  }
}
