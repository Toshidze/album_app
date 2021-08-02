class Album {
  final int userId;
  final int id;
  final String title;
  final String? firstPhoto;

  Album({
    required this.userId,
    required this.id,
    required this.title,
    required this.firstPhoto,
  });

  factory Album.fromJson(
      Map<String, dynamic> json, Map<int, String> firstPhoto) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      firstPhoto: firstPhoto[json['id'] as int],
    );
  }
}
