import 'package:app_for_trood/models/user_model.dart';
import 'package:hive/hive.dart';

part "album_model.g.dart";

@HiveType(typeId: 0)
class Album {
  @HiveField(0)
  final int userId;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? firstPhoto;

  Album({
    required this.userId,
    required this.id,
    required this.title,
    required this.firstPhoto,
  });

  factory Album.fromJson(
    Map<String, dynamic> json,
    Map<int, String> firstPhoto,
  ) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      firstPhoto: firstPhoto[json['id'] as int],
    );
  }
}

User? extractUser(List<User> users, int userId) {
  for (var user in users) {
    if (userId == user.id) {
      return user;
    }
  }
  return null;
}
