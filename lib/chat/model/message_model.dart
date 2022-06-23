import 'dart:convert';

class Message {
  Message({
    required this.classId,
    required this.comment,
  });

  int classId;
  Comment comment;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        classId: json["class_id"],
        comment: Comment.fromJson(json["comment"]),
      );

  Map<String, dynamic> toJson() => {
        "class_id": classId,
        "comment": comment.toJson(),
      };
}

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Comment {
  int classId;
  String message;
  String type;
  String name;
  int timeOfVideo;
  int userId;

  Comment({
    required this.classId,
    required this.message,
    required this.type,
    required this.name,
    required this.timeOfVideo,
    required this.userId,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        classId: json["class_id"],
        message: json["message"],
        type: json["type"],
        name: json["name"],
        timeOfVideo: json["time_of_video"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "class_id": classId,
        "message": message,
        "type": type,
        "name": name,
        "time_of_video": timeOfVideo,
        "user_id": userId,
      };
}
