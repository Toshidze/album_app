import 'dart:developer';
import 'package:app_for_trood/repositories/photo_repo.dart';
import 'package:app_for_trood/repositories/post_repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/userModel.dart';

const uriUsers = 'https://jsonplaceholder.typicode.com/users';

const uriPosts = 'https://jsonplaceholder.typicode.com/posts';
const uriPhotos = 'https://jsonplaceholder.typicode.com/photos';

class UserRepo extends ChangeNotifier {
  getUsers() async {
    var mapNumAlbums = await PhotoRepo().getAlbumsMap();
    var mapNumPosts = await PostRepo().getNumPostMap();
    List childrenUser = [];
    var response = await http.get(Uri.parse(uriUsers));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List<dynamic>;
      final userData = data
          .map((dynamic e) => User.fromJson(
              e as Map<String, dynamic>, mapNumAlbums, mapNumPosts))
          .toList();
      childrenUser = userData;
      return userData;
    } else {
      log('ERROR');
    }
    return childrenUser;
  }
}
