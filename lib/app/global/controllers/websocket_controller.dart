import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/message_model.dart';
import 'package:simbora_app/app/data/model/ride_offer_model.dart';

import 'package:simbora_app/app/data/model/user_model.dart';
import 'package:simbora_app/app/modules/chat/controllers/chat_controller.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../env.dart';

class WebSocketController extends GetxController {
  WebSocketChannel? channel; //initialize a websocket channel
  bool isWebsocketRunning = false; //status of a websocket
  int retryLimit = 3;
  RxList data = [].obs;

  void _setData(List _data) {
    for (var _singularData in (_data)) {
      data.add(_singularData);
    }
  }

  void startStream(String token) async {
    if (isWebsocketRunning) return; //chaech if its already running
    final url = WS_URL + '/ws/sync/$token/';
    channel = WebSocketChannel.connect(
      Uri.parse(url), //connect to a websocket
    );
    channel!.stream.listen(
      (event) {
        data.add(json.decode(event)['message']);
        //print(json.decode(event)['message']);
        var action = json.decode(event)['action'];

        switch (action) {
          case 'request_for_ride':
            sendNotificationRequest(json.decode(event)['message']);
            break;
          case 'ride_approximate':
            sendNotificationRide(json.decode(event)['message']);
            break;
          case 'message_ride':
            sendNotificationMessage(json.decode(event)['message']);
            final controllerChat = Get.find<ChatController>();
            controllerChat.getAllfromRide();

            break;
          default:
        }
      },
      onDone: () {
        isWebsocketRunning = false;
      },
      onError: (err) {
        isWebsocketRunning = false;
        if (retryLimit > 0) {
          retryLimit--;
          startStream(token);
        }
      },
    );
  }

  /* Future<void> updateListMessages(content) async {
    MessageRide msg = MessageRide(
        id: 0,
        user: User.fromJson(content['user']),
        ride: RideOffer.fromJson(content['ride']),
        text: content['text'],
        createdAt: content['createdAt']);
    final controllerChat = Get.find<ChatController>();
    controllerChat.listMessages.insert(0, msg);
  } */

  Future sendMsg(String acao, {dynamic valor, dynamic index}) async {
    if (isWebsocketRunning) return; //chaech if its already running
    channel!.sink.add(json.encode({
      "action": acao,
      "value": valor,
      "index": index,
    }));
  }

  void closeStream() {
    //disposes of the stream
    channel!.sink.close();
    isWebsocketRunning = false;
  }

  void sendNotificationRequest(content) async {
    String user = content['sender']['first_name'];
    var avatar = content['sender']['avatar'];
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 100,
            channelKey: "notifications_channel",
            title: "Nova Solicitação",
            body: user.length > 15
                ? '${user.substring(0, 15)}... solicitou participar da sua carona.'
                : '${user}... solicitou participar da sua carona.',
            showWhen: true,
            payload: {"secret": "Awesome Notifications Rocks!"}));
  }

  void sendNotificationMessage(content) async {
    String user = content['user']['first_name'];
    var avatar = content['user']['avatar'];
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 100,
            channelKey: "notifications_channel",
            title: "Nova Menssagem",
            body: '${user.substring(0, 15)}... Enviou uma menssagem...',
            showWhen: true,
            payload: {"secret": "Awesome Notifications Rocks!"}));
  }

  void sendNotificationRide(content) async {
    String user = content['owner']['first_name'];
    var avatar = content['owner']['avatar'];
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 100,
            channelKey: "notifications_channel",
            title: "Nova Solicitação",
            body:
                '${user.substring(0, 15)}... Criou uma carona que passará perto de você.',
            showWhen: true,
            payload: {"secret": "Awesome Notifications Rocks!"}));
  }
}
