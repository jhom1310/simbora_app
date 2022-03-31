import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  final txtTheme = 'Tema escuro'.obs;
  late Position userPosition;

  void toggleTheme() {
    ThemeMode theme;

    if (Get.isDarkMode) {
      theme = ThemeMode.light;
      txtTheme.value = 'Tema escuro';
    } else {
      theme = ThemeMode.dark;
      txtTheme.value = 'Tema claro';
    }
    Get.changeThemeMode(theme);
  }
}
