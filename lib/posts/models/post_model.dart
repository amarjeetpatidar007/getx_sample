

class Posts {
  Posts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };

  static List<Posts> listFromJSON(List<dynamic> list) => List<Posts>.from(list.map((e) => Posts.fromJson(e)));

}
