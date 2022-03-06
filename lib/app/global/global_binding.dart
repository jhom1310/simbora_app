import 'package:get/instance_manager.dart';
import 'package:simbora_app/app/global/global_controller.dart';
import 'package:simbora_app/app/global/global_user_info_controller.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GlobalController(), permanent: true);
    Get.put(GlobalUserInfoController(), permanent: true);
  }
}
