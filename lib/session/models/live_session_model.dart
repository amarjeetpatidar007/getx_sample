import 'dart:convert';

LiveSessionModel liveSessionModelFromJson(String str) =>
    LiveSessionModel.fromJson(json.decode(str));

String liveSessionModelToJson(LiveSessionModel data) =>
    json.encode(data.toJson());

class LiveSessionModel {
  String status;
  int code;
  Data data;
  String message;

  LiveSessionModel({
    required this.status,
    required this.code,
    required this.data,
    required this.message,
  });

  factory LiveSessionModel.fromJson(Map<String, dynamic> json) =>
      LiveSessionModel(
        status: json["status"],
        code: json["code"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  int id;
  dynamic title;
  Video video;
  bool finished;
  bool live;
  bool hasSessionEndQuiz;

  Data({
    required this.id,
    this.title,
    required this.video,
    required this.finished,
    required this.live,
    required this.hasSessionEndQuiz,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        video: Video.fromJson(json["video"]),
        finished: json["finished"],
        live: json["live"],
        hasSessionEndQuiz: json["has_session_end_quiz"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "video": video.toJson(),
        "finished": finished,
        "live": live,
        "has_session_end_quiz": hasSessionEndQuiz,
      };
}

class Video {
  int id;
  String videoUrl;
  int minutes;
  int seconds;
  Teacher teacher;

  Video({
    required this.id,
    required this.videoUrl,
    required this.minutes,
    required this.seconds,
    required this.teacher,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        videoUrl: json["video_url"],
        minutes: json["minutes"],
        seconds: json["seconds"],
        teacher: Teacher.fromJson(json["teacher"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "video_url": videoUrl,
        "minutes": minutes,
        "seconds": seconds,
        "teacher": teacher.toJson(),
      };
}

class Teacher {
  int id;
  String name;
  String image;

  Teacher({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
