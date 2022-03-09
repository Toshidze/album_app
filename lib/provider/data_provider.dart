import 'package:app_for_trood/main.dart';
import 'package:app_for_trood/models/photoModel.dart';
import 'package:app_for_trood/repositories/photo_repo.dart';
import 'package:app_for_trood/repositories/user_repo.dart';
import 'package:flutter/material.dart';

class GetData extends ChangeNotifier {
  List<dynamic> userInfo = [];
  Future<List> userInfoList() async {
    userInfo = await UserRepo().getUsers();
    notifyListeners();
    return userInfo;
  }

  showToastDone(context) async {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        content: Text(
          'Post changed',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
    await Future.delayed(Duration(seconds: 3));
    scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    notifyListeners();
  }

  Future<List<Photo>> postId(idPhoto) async {
    var postId = await PhotoRepo().fetchPhotos(idPhoto);
    return postId;
  }

  List<dynamic> albumModel = [];

  Future<List> photoInfoList() async {
    albumModel = await PhotoRepo().fetchAlbum();
    return albumModel;
  }

  showPhotoToastDone() async {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        content: Text(
          'Photo added',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
    await Future.delayed(Duration(seconds: 3));
    scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
  }

  showToastValidPicture() async {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'no photo',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
    await Future.delayed(Duration(seconds: 3));
    scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
  }
}
