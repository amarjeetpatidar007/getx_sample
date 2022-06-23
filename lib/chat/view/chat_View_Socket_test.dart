import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getx_project/chat/controller/chat_controller.dart';
import 'package:getx_project/chat/model/message_model.dart';
import 'package:getx_project/chat/network%20service/socketService.dart';

class ChatViewTestScreen extends GetView<ChatController> {
  const ChatViewTestScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    ScrollController scrollController = ScrollController();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromRGBO(237, 236, 244, 1),
        body: StreamBuilder<List<Message>>(
            stream: SocketService.messageStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                return Text(" ");
              } else {
                return const Center(
                  child: Text('No Chats Found'),
                );
              }
            }),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 12),
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
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 10,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        controller
                            .addMessageToSocket(textEditingController.text);
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
              SizedBox(
                height: 12.0,
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
