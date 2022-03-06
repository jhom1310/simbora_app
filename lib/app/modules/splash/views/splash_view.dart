import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: Get.width,
      height: Get.height,
      padding: const EdgeInsets.only(
        left: 72,
        right: 71,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 232,
            height: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 143,
                  height: 143,
                  child: Image.asset('assets/images/simbora_logo.png'),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  child: LinearProgressIndicator(),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
