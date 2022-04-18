import 'package:app_for_trood/models/post_model.dart';
import 'package:app_for_trood/models/user_model.dart';
import 'package:app_for_trood/repositories/user_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const uriUsers = 'https://jsonplaceholder.typicode.com/users/';

const uriPosts = 'https://jsonplaceholder.typicode.com/posts';
const uriUserPosts = 'https://jsonplaceholder.typicode.com/posts';
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
    var users = await UserRepo().getUsers();

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

  Future<List<dynamic>> fetchUserPosts(userId) async {
    List<User> users = await UserRepo().getUsers();

    List childrenPost = [];
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users/$userId/posts'));
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
