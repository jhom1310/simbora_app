import 'package:get/get.dart';
import 'package:simbora_app/app/data/repository/chat_repository.dart';

import '../controllers/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatRepository>(() => ChatRepository());
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
