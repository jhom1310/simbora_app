import 'package:flutter/material.dart';
import 'package:simbora_app/app/global/global_binding.dart';

import 'package:simbora_app/app/global/themes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
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
