class ChatMessageModel {
  int id;
  String userName;
  String imageUrl;
  String message;
  String status;

  ChatMessageModel(
      {required this.id,
      required this.userName,
      required this.imageUrl,
      required this.message,
      required this.status});

  factory ChatMessageModel.fromJSON(Map<String, dynamic> map) {
    return ChatMessageModel(
        id: map['id'],
        userName: map['userName'],
        imageUrl: map['image'],
        status: map['status'],
        message: map['message']);
  }
}
