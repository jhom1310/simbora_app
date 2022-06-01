import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/user_model.dart';
import 'package:simbora_app/app/data/provider/headers.dart';
import 'package:simbora_app/app/database/auth_token.dart';
import 'package:simbora_app/app/database/store.dart';
import 'package:simbora_app/app/database/store_keys.dart';
import 'package:simbora_app/app/global/controllers/global_controller.dart';
import 'package:simbora_app/app/global/controllers/global_user_info_controller.dart';
import 'package:simbora_app/app/global/controllers/websocket_controller.dart';
import 'package:simbora_app/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final globalcontroller = Get.find<GlobalController>();
  final globalControllerUser = Get.find<GlobalUserInfoController>();
  final wscontroller = Get.find<WebSocketController>();

  @override
  void onReady() {
    loading();
    super.onReady();
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    globalcontroller.userPosition = await Geolocator.getCurrentPosition();

    return globalcontroller.userPosition;
  }

  Future<void> loading() async {
    determinePosition();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    Timer(Duration(seconds: 2), () async {
      if (Store.hasKey(StoreKeys.TOKEN)) {
        var userData = await Store.getMap('SESSION');
        globalControllerUser.setSession(User.fromJson(userData!));
        //Adiquire o token de acesso
        String token = Store.getString('TOKEN');
        AuthToken.token = token;
        Headers.headers = {'Authorization': 'Token ' + AuthToken.token!};
        wscontroller.startStream(AuthToken.token!);
        Get.offAndToNamed(Routes.HOME);
      } else {
        Get.offAndToNamed(Routes.LOGIN);
      }
    });
  }
}
