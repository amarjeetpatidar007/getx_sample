import 'package:get/get.dart';
import 'package:getx_project/session/session_api/live_session_api.dart';

import 'models/live_session_model.dart';

class SessionController extends GetxController {
  bool isLive = false;

  Future<bool> getLiveSession() async {
    LiveSessionModel model =
        await LiveSessionApiService.getLiveSessionDetails();
    print(model);
    if (model.data.live == true) {
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
