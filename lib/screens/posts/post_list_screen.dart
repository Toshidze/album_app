import 'package:app_for_trood/screens/posts/post_list.dart';
import 'package:flutter/material.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: const PostList(),
    );
  }
}
