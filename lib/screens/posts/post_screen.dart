import 'package:app_for_trood/models/post_model.dart';
import 'package:app_for_trood/screens/posts/show_modal_edit_post.dart';
import 'package:app_for_trood/utilities/main_color.dart';
import 'package:flutter/material.dart';
import 'package:app_for_trood/utilities/constants.dart';

class PostScreen extends StatelessWidget {
  final Post postItem;
  const PostScreen({Key? key, required this.postItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                postItem.user!.name.toString(),
                overflow: TextOverflow.fade,
                style: const TextStyle(
                  color: MainColor.mainAccentColorYelow,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ShowModalEditPost(postItem: postItem)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              postItem.title,
              style: kSubTitleTextStyle,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              postItem.body,
              style: kBodyTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
