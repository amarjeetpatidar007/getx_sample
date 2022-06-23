import 'package:get/get.dart';
import 'package:getx_project/session/session_api/live_session_api.dart';

import '../chat/network service/socketService.dart';
import 'models/live_session_model.dart';

class SessionController extends GetxController {
  bool isLive = false;

  joinLiveClassChat() {
    return SocketService.joinClass();
  }

  Future<bool> getLiveSession() async {
    LiveSessionModel model =
        await LiveSessionApiService.getLiveSessionDetails();
    if (model.status == "success") {
      isLive = true;
      update();
    } else {
      isLive = false;
      update();
    }
    print("returned $isLive");
    return isLive;
  }
}
