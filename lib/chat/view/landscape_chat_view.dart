import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getx_project/chat/controller/chat_controller.dart';

import '../../theme.dart';
import '../model/chat_model.dart';
import '../utils/common_widgets.dart';

class ChatViewLandscapeOrientation extends GetView<ChatController> {
  const ChatViewLandscapeOrientation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChatController());
    TextEditingController textEditingController = TextEditingController();
    ScrollController scrollController = ScrollController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Themes.bgColor,
      body: SafeArea(
        child: Row(
          children: [
            Container(
                color: Colors.black,
                height: 375,
                width: 545,
                child: const Text('Live')),
            Container(
              padding: const EdgeInsets.only(bottom: 30),
              width: 210,
              child: GetBuilder<ChatController>(builder: (controller) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        // shrinkWrap: true,
                        controller: scrollController,
                        itemCount: controller.messageList.length,
                        itemBuilder: (BuildContext context, int index) {
                          //Scroll To Last INDEX - ListView
                          // scrollController.jumpTo(
                          //     scrollController.position.maxScrollExtent);

                          ChatMessageModel messageModel =
                              controller.messageList[index];
                          return messageModel.status == 'joined'
                              ? joinedChatChip(userName: messageModel.userName)
                              : userMessage(
                                  userName: messageModel.userName,
                                  message: messageModel.message);
                        },
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0, left: 10.0, bottom: 12.0),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 150,
                                child: TextFormField(
                                    controller: textEditingController,
                                    minLines: 1,
                                    maxLines: 4,
                                    style: TextStyle(fontSize: 10),
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.zero,
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: "Message",
                                        focusedBorder: InputBorder.none,
                                        border: InputBorder.none
                                        // enabledBorder: ,
                                        )),
                              ),
                              const SizedBox(
                                width: 6.0,
                              ),
                              Container(
                                width: 35,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller
                                        .addMessage(textEditingController.text);
                                  },
                                  child: SvgPicture.asset(
                                    "assets/send.svg",
                                    // height: 40,
                                    // width: 40,
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
                            controller.addEmoji(
                              emoji: '👎🏻',
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
