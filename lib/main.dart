import 'package:flutter/material.dart';
import 'package:simbora_app/app/global/global_binding.dart';
import 'package:simbora_app/app/global/themes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';

import 'package:awesome_notifications/awesome_notifications.dart';

void initializeApp() async {
  AwesomeNotifications().initialize(
      null, // this makes you use your default icon, if you haven't one
      [
        NotificationChannel(
            channelKey: 'notifications_channel',
            channelName: 'Notificações do solicitações',
            channelDescription:
                'Notifica quando um usuario recebe uma solicitação',
            defaultColor: Colors.blueAccent,
            ledColor: Colors.white)
      ]);
}

Future<void> main() async {
  await GetStorage.init();
  initializeApp();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalBinding(),
    ),
  );
}
