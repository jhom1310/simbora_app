import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/message_model.dart';
import 'package:simbora_app/app/data/model/ride_offer_model.dart';
import 'package:simbora_app/app/data/model/user_model.dart';

import 'package:simbora_app/app/data/repository/chat_repository.dart';
import 'package:simbora_app/app/global/controllers/global_user_info_controller.dart';
import 'package:simbora_app/app/global/widgets/dialogs/response_dialogs.dart';

class ChatController extends GetxController {
  final repository = Get.find<ChatRepository>();
  final useractive = Get.find<GlobalUserInfoController>().getSession;

  TextEditingController ctrlText = TextEditingController();
  RideOffer rideoffer = Get.arguments;
  RxList<MessageRide> listMessages = <MessageRide>[].obs;

  Future<List<MessageRide>> getAllfromRide() async {
    //return await repository.getAll();
    await repository.getAllfromRide(rideoffer).then((value) {
      listMessages.assignAll(value);
    }, onError: (err) {
      Get.dialog(FailureDialog('Falha na requisição'));
    });
    print('listMessages');
    return listMessages;
  }

  Future<void> sendMessageOnPressed() async {
    MessageRide msg = MessageRide(
        id: 0,
        user: useractive!,
        ride: rideoffer,
        text: ctrlText.text,
        createdAt: DateTime.now());
    listMessages.insert(0, msg);
    await repository.createMessage(msg);
  }

  @override
  void onInit() {
    getAllfromRide();
    print('object');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
