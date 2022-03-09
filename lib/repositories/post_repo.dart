import 'package:app_for_trood/models/postModel.dart';
import 'package:app_for_trood/repositories/user_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/userModel.dart';

const uriUsers = 'https://jsonplaceholder.typicode.com/users';

const uriPosts = 'https://jsonplaceholder.typicode.com/posts';
const uriPhotos = 'https://jsonplaceholder.typicode.com/photos';

class PostRepo extends ChangeNotifier {
  getNumPostMap() async {
    var response = await http.get(Uri.parse(uriPosts));
    String data = response.body;
    var decodeData = jsonDecode(data);
    Map<int, int> mapNumPosts = {};
    for (Map post in decodeData) {
      var userId = post['userId'] as int;

      var count = mapNumPosts[userId] ?? 0;
      mapNumPosts[userId] = count + 1;
    }

    return mapNumPosts;
  }

  Future<List<dynamic>> fetchPosts() async {
    List<User> users = await UserRepo().getUsers();

    List childrenPost = [];
    final response = await http.get(Uri.parse(uriPosts));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List<dynamic>;
      final postData = data
          .map((dynamic e) => Post.fromJson(e as Map<String, dynamic>, users))
          .toList();

      childrenPost = postData;
      return childrenPost;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
