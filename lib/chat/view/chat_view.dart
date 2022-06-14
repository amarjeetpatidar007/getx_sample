import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getx_project/chat/controller/chat_controller.dart';
import 'package:getx_project/chat/model/chat_model.dart';
import 'package:getx_project/chat/utils/common_widgets.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    ScrollController scrollController = ScrollController();
    Get.put(ChatController());
    // print(controller.readJsonData());

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromRGBO(237, 236, 244, 1),
        body: GetBuilder<ChatController>(
          init: ChatController(),
          builder: (controller) {
            return ListView.builder(
              controller: scrollController,
              itemCount: controller.messageList.length,
              itemBuilder: (BuildContext context, int index) {
                //Scroll To Last INDEX - ListView
                // scrollController.jumpTo(scrollController.position.maxScrollExtent);

                ChatMessageModel messageModel = controller.messageList[index];
                return messageModel.status == 'joined'
                    ? joinedChatChip(userName: messageModel.userName)
                    : userMessage(
                        userName: messageModel.userName,
                        message: messageModel.message);
              },
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // height: 40,
                      width: 300,
                      child: TextFormField(
                          controller: textEditingController,
                          minLines: 1,
                          maxLines: 4,
                          decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Message",
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none
                              // enabledBorder: ,
                              )),
                    ),
                    Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.addMessage(textEditingController.text);
                        },
                        child: SvgPicture.asset(
                          "assets/send.svg",
                          height: 25,
                          width: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  controller.addEmoji(emoji: '😀'),
                  controller.addEmoji(emoji: '😍'),
                  controller.addEmoji(emoji: '🤔'),
                  controller.addEmoji(emoji: '👏🏻'),
                  controller.addEmoji(emoji: '👍🏻'),
                  controller.addEmoji(emoji: '👎🏻'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
