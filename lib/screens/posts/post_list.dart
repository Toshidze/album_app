import 'package:app_for_trood/repositories/post_repo.dart';
import 'package:app_for_trood/screens/posts/post_screen.dart';
import 'package:app_for_trood/utilities/constants.dart';
import 'package:app_for_trood/utilities/main_color.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class PostList extends StatelessWidget {
  const PostList({
    Key? key,
    this.lengthList,
    this.userId,
  }) : super(key: key);

  final int? lengthList;
  final int? userId;

  @override
  Widget build(BuildContext context) {
    var data = userId == null
        ? context.read<PostRepo>().fetchPosts()
        : context.read<PostRepo>().fetchUserPosts(userId);
    return FutureBuilder(
        future: data,
        builder: (context, AsyncSnapshot<Object?> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            var ssData = snapshot.data as List;
            return PostListHive(
                lengthList: lengthList, ssData: ssData, userId: userId);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

class PostListHive extends StatelessWidget {
  const PostListHive({
    Key? key,
    required this.lengthList,
    required this.ssData,
    required this.userId,
  }) : super(key: key);

  final int? lengthList;
  final List ssData;
  final int? userId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: lengthList == null ? ssData.length : 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 5,
                      offset: const Offset(0, 2))
                ],
              ),
              child: Material(
                borderRadius: BorderRadius.circular(5),
                child: InkWell(
                  borderRadius: BorderRadius.circular(5),
                  splashColor: MainColor.mainAccentColorYelow.withOpacity(0.1),
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
                            userId == null
                                ? const Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.grey,
                                    ),
                                  )
                                : const SizedBox(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    ssData[index].title,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: kTitleTextStyle,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: SizedBox(
                                    width: 260,
                                    child: Text(
                                      ssData[index].body,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: kSubTitleTextStyle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Icon(
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
