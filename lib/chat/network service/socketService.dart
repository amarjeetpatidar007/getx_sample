import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  static late IO.Socket socket;
  static const String liveClassEndPoint =
      "https://planner-live-classes.toppersnotes.com";
  static const String _token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTVkN2JkZTg1ZjdlOWYxOWJhZjk0OTQwMWY1NzY5NjM5OGQ3OGI3YTZiNzUxOTc4NjdiZjY0MmM2MWMyYzY1MjU0MGZmNzViNTAwNzRiMWYiLCJpYXQiOiIxNjI5MzUxMDc5LjEyMDkwMCIsIm5iZiI6IjE2MjkzNTEwNzkuMTIwOTAzIiwiZXhwIjoiMTY2MDg4NzA3OS4xMTYxMTAiLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.NxvT6255n-U1Iz4IOWitM2W8qA0aRfbq3uLpl_TSamNSL-wP3lYYvdhaJ6zB0t2WdErL0EadLhp6qiI4PvVKSnoBYcvwI45coDJ2RQMl0WjxEWlacEFzbWRaE9tX6q321aqWfkCnpY94Yk_49SdEAZt6I__N1ElD_F2azdrEUjFYjZhnovBNkSk8U8qD4LyqY6ythkJ2P46AXMrFzxPbRapwQBUmzPzClZbSpYHB4iI6hF6MIergyJLESHlJUmjPJwq79KL2S_Ad3U2J91TxzIJsZGn0qV426kGcF5L96pPZxhlyoz_lgUV6jGc9UB0PzrwDHIlzvf4NznWzLBpyIne_EHwITOR74HJh2GOEiES3_PZHqzFT2NYgeJkp0Zg462d02io2VMLwe11Ei7x6SfMPnbTXjKxzjpr6D7Q3Z_84fLowvFfVXgYmJq5iv8EQCT9YZBj0nALp3YNsa6-4xc_NjK8tgfFTyohWec9D2x7tWQ-p3ACe5ZMCBBB48TWwPmdDo0gmccGXt7jZ3xiOiV1OTWYBo7JnxKjfrMzIC4BNUzAwnRMJ-p68H5UJj7_UrKCAvB8Vmn0_d8jnMMCIZ1m3qihD2wxAYKYIGVrbffU4Y0lgYgUBTLU5U9ZgJmVswqqbdNcGQrrgCzwGJcALS9qZPT5z-iV88-1EgemwBbA";

  static void connectToServer() {
    try {
      // Configure socket transports must be sepecified
       socket = IO.io(
          liveClassEndPoint,
          IO.OptionBuilder()
              .setTransports(['websocket']) // for Flutter or Dart VM
              .build());

      // Connect to websocket
      socket.connect();

      // Handle socket events
      socket.onConnect((handler) {
        print('connected ---------');
        print(socket.id);
        socket.on('class_started', (data) => print(data));
        socket.on('class_finished', (data) => print(data));
        socket.on('count', (data) => print(data));
        socket.on('new_comment', (data) => print(data));
        socket.on('old_comment', (data) => print(data));
        socket.on('disconnect', (_) => print('disconnect'));
      });

    } catch (e) {
      print(e.toString());
    }
  }

static joinClass() {
  socket.emit(
    "join",
    {"class_id": 1397, "token": _token},
  );
}
//
// // Send a Message to the server
static sendMessage(String message) {
  socket.emit(
    "send_message",
    {
      "message": message,
      "type": "text",
      "time_of_event": 90,
    },
  );
}
}
