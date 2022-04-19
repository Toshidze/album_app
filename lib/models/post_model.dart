import 'package:app_for_trood/models/user_model.dart';
import 'package:hive/hive.dart';

part "post_model.g.dart";

@HiveType(typeId: 5)
class Post {
  @HiveField(0)
  final int userId;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String body;
  @HiveField(4)
  final User? user;

  const Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    this.user,
  });

  factory Post.fromJson(Map<String, dynamic> json, List<User> users) {
    return Post(
      userId: json['userId'] ?? 1,
      id: json['id'],
      title: json['title'],
      body: json['body'],
      user: extractUser(users, json['userId']),
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
