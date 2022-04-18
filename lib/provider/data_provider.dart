import 'package:app_for_trood/main.dart';
import 'package:app_for_trood/models/photo_model.dart';
import 'package:app_for_trood/repositories/photo_repo.dart';
import 'package:app_for_trood/repositories/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class GetData extends ChangeNotifier {
  Future<List<dynamic>> userInfoList() async {
    final users = Hive.box('UserBox').get('2', defaultValue: []);
    if (users.isNotEmpty) return users;
    var userInfo = await UserRepo().getUsers();
    Hive.box('UserBox').put('2', userInfo);

    return userInfo;
  }

  showToastDone(context) async {
    scaffoldMessengerKey.currentState?.showSnackBar(
      const SnackBar(
        backgroundColor: Colors.transparent,
        content: Text(
          'Post changed',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
    await Future.delayed(const Duration(seconds: 3));
    scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
  }

  Future<List<Photo>> postId(idPhoto) async {
    var postId = await PhotoRepo().fetchPhotos(idPhoto);
    notifyListeners();
    return postId;
  }

  List<dynamic> albumModel = [];

  photoInfoList() async {
    albumModel = await PhotoRepo().fetchAlbum();
    return albumModel;
  }

  showPhotoToastDone() async {
    scaffoldMessengerKey.currentState?.showSnackBar(
      const SnackBar(
        backgroundColor: Colors.transparent,
        content: Text(
          'Photo added',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
    await Future.delayed(const Duration(seconds: 3));
    scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
  }

  showToastValidPicture() async {
    scaffoldMessengerKey.currentState?.showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'no photo',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
    await Future.delayed(const Duration(seconds: 3));
    scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
  }
}
