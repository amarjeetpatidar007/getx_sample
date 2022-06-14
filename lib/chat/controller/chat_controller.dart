import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_project/chat/model/chat_model.dart';
import 'package:getx_project/chat/utils/common_widgets.dart';

class ChatController extends GetxController {
  List<ChatMessageModel> messageList = [];

  // ScrollController scrollController = ScrollController();

  void init() {
    readJsonData();
  }

  readJsonData() async {
    //read json file
    final jsonData = await rootBundle.loadString('lib/chat_message.json');
    //decode json data as list
    final list = json.decode(jsonData) as List<dynamic>;
    // print(jsonData);
    //map json and initialize
    // List<ChatMessageModel> msgList = list.map((e) => ChatMessageModel.fromJSON(e)).toList();
    messageList.addAll(list.map((e) => ChatMessageModel.fromJSON(e)).toList());
  }

  addMessage(String message) {
    messageList.add(ChatMessageModel(
        id: 10,
        userName: "U",
        imageUrl: "imageUrl",
        message: message,
        status: "messaged"));
    update();
  }

  //
  addEmoji({required String emoji}) {
    return emojiButton(
        emoji: emoji,
        onPressed: () {
          addMessage(emoji);
        });
    update();

    // scrollToLast(){
    //   return scrollController.jumpTo(scrollController.position.maxScrollExtent);
    // }
  }
}
