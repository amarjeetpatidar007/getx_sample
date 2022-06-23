import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/chat/view/chat_View_Socket_test.dart';
import 'package:getx_project/session/controller.dart';

import '../chat/network service/socketService.dart';

class SessionPage extends GetView<SessionController> {
  const SessionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session Page'),
      ),
      body: Center(
        child: GetBuilder<SessionController>(
            init: SessionController(),
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  controller.isLive
                      ? ElevatedButton(
                          onPressed: () {
                            controller.joinLiveClassChat();
                            Get.to(const ChatViewTestScreen());
                          },
                          child: const Text('Join Live Chat'))
                      : const Text('Chat is Not Live'),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        SocketService.connectToServer();
                        controller.getLiveSession();
                        print(controller.isLive);
                      },
                      child: const Text('Get Live Session Data'))
                ],
              );
            }),
      ),
    );
  }
}
