import 'package:get/instance_manager.dart';
import 'package:simbora_app/app/data/repository/chat_repository.dart';
import 'package:simbora_app/app/global/controllers/global_controller.dart';
import 'package:simbora_app/app/global/controllers/global_user_info_controller.dart';
import 'package:simbora_app/app/global/controllers/websocket_controller.dart';
import 'package:simbora_app/app/modules/chat/controllers/chat_controller.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GlobalController(), permanent: true);
    Get.put(GlobalUserInfoController(), permanent: true);

    Get.put(WebSocketController(), permanent: true);
  }
}
