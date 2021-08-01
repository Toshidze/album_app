import 'dart:developer';
import 'package:app_for_trood/models/userModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const uriUsers = 'https://jsonplaceholder.typicode.com/users';
const uriAlbums = 'https://jsonplaceholder.typicode.com/albums';
const uriPosts = 'https://jsonplaceholder.typicode.com/posts';

class ApiHelper {
  getUsers() async {
    List childrenUser = [];
    var response = await http.get(Uri.parse(uriUsers));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List<dynamic>;
      final userData = data
          .map((dynamic e) => User.fromJson(e as Map<String, dynamic>))
          .toList();

      childrenUser = userData;
      return userData;
    } else {
      log('ERROR');
    }
    return childrenUser;
  }

  getAlbums(id) async {
    int? countAlbums;
    List childrenAlbums = [];
    var response = await http.get(Uri.parse(uriAlbums));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      childrenAlbums = decodeData;
      int count = childrenAlbums
          .where((element) => element['userId'] == decodeData[id]['userId'])
          .length;
      countAlbums = count;
      return count;
    } else {
      log('ERROR');
    }
    return countAlbums;
    // return childrenAlbums;
  }
}
