import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';

import 'package:simbora_app/app/data/model/user_model.dart';
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

  void closeFoodStream() {
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
            body:
                '${user.substring(0, 15)}... solicitou participar da sua carona.',
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
