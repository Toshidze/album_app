import 'dart:convert';
import 'package:app_for_trood/models/albumModel.dart';
import 'package:app_for_trood/services/networkingUsers.dart';
import 'package:http/http.dart' as http;

class AlbumClass {
  fetchAlbum() async {
    var firstPhoto = await ApiHelper().getFirstPhoto();
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
}
