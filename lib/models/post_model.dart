import 'package:app_for_trood/models/user_model.dart';

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
    this.user,
  });

  factory Post.fromJson(Map<String, dynamic> json, List<User> users) {
    return Post(
      userId: json['userId'],
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
