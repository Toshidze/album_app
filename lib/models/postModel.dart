import 'package:app_for_trood/models/userModel.dart';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  final User? user;

  const Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    required this.user,
  });

  factory Post.fromJson(Map<String, dynamic> json, List<User> users) {
    return Post(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
      user: extractUser(users, json['userId'] as int),
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
