import 'dart:convert';
import 'package:app_for_trood/models/albumModel.dart';
import 'package:app_for_trood/models/photoModel.dart';
import 'package:app_for_trood/repositories/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const uriAlbums = 'https://jsonplaceholder.typicode.com/albums';

class PhotoRepo extends ChangeNotifier {
  fetchAlbum() async {
    var firstPhoto = await getFirstPhoto();
    List childrenAlbum = [];
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List<dynamic>;
      final albumData = data
          .map((dynamic e) =>
              Album.fromJson(e as Map<String, dynamic>, firstPhoto))
          .toList();

      childrenAlbum = albumData;
      return childrenAlbum;
    } else {
      throw Exception('Failed to load album');
    }
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

  Future<List<Photo>> fetchPhotos(id) async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/albums/$id/photos'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List<dynamic>;
      final postData = data
          .map((dynamic e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList();

      return postData;
    } else {
      throw Exception('Failed to load album');
    }
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
}
