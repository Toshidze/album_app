import 'dart:async';
import 'dart:convert';

import 'package:app_for_trood/models/photoModel.dart';
import 'package:http/http.dart' as http;

int id = 1;

Future<List<Photo>> fetchPhotos(id) async {
  List<Photo> childrenPost = [];
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/$id/photos'));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body) as List<dynamic>;
    final postData = data
        .map((dynamic e) => Photo.fromJson(e as Map<String, dynamic>))
        .toList();

    childrenPost = postData;
    return childrenPost;
  } else {
    throw Exception('Failed to load album');
  }
}
