import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'controller/chat_controller.dart';

class AppBinding implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.put(() => ChatController());
  }
}
