import 'dart:developer';
import 'package:app_for_trood/models/postModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/userModel.dart';

const uriUsers = 'https://jsonplaceholder.typicode.com/users';
const uriAlbums = 'https://jsonplaceholder.typicode.com/albums';
const uriPosts = 'https://jsonplaceholder.typicode.com/posts';
const uriPhotos = 'https://jsonplaceholder.typicode.com/photos';

class ApiHelper {
  getUsers() async {
    var mapNumAlbums = await getAlbumsMap();
    var mapNumPosts = await getNumPostMap();
    List childrenUser = [];
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
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

  getAlbumsMap() async {
    var response = await http.get(Uri.parse(uriAlbums));
    String data = response.body;
    var decodeData = jsonDecode(data);
    Map<int, int> mapNumAlbums = {};
    for (Map album in decodeData) {
      var userId = album['userId'] as int;

      var count = mapNumAlbums[userId] ?? 0;
      mapNumAlbums[userId] = count + 1;
    }

    return mapNumAlbums;
  }

  getNameAlbumsMap() async {
    var response = await http.get(Uri.parse(uriAlbums));
    String data = response.body;
    var decodeData = jsonDecode(data);
    List<String> listNumAlbums = [];
    for (Map album in decodeData) {
      listNumAlbums.add(album['title'] as String);
    }

    return listNumAlbums;
  }

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

  getFirstPhoto() async {
    var response = await http.get(Uri.parse(uriPhotos));
    String data = response.body;
    var decodeData = jsonDecode(data);
    Map<int, String> mapPhotos = {};
    for (Map photo in decodeData) {
      var idPhoto = photo['albumId'] as int;
      if (!mapPhotos.containsKey(idPhoto)) {
        mapPhotos[idPhoto] = photo['thumbnailUrl'];
      }
    }
    return mapPhotos;
  }

  fetchPosts() async {
    List<User> users = await getUsers();

    List childrenPost = [];
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

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
