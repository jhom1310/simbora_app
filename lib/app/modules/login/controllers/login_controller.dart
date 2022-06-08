import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/login_model.dart';
import 'package:simbora_app/app/data/model/login_sigaa_model.dart';
import 'package:simbora_app/app/database/auth_token.dart';
import 'package:simbora_app/app/global/controllers/websocket_controller.dart';
import 'package:simbora_app/app/routes/app_pages.dart';
import 'package:simbora_app/app/data/repository/auth_repository.dart';

class LoginController extends GetxController {
  final repository = Get.find<AuthRepository>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlPass = TextEditingController();

  final wsController = Get.find<WebSocketController>();

  final rememberMe = false.obs;
  final show = true.obs;
  final showIcon = Icons.visibility_off.obs;
  final loginSuccess = true.obs;
  Rx<bool> loading = Rx<bool>(false);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void toggleCheckBox() => rememberMe.value = !rememberMe.value;

  void showPassword() {
    show.value = !show.value;
    if (showIcon.value == Icons.visibility_off)
      showIcon.value = Icons.visibility;
    else
      showIcon.value = Icons.visibility_off;
  }

  Future<void> loginOnPressed() async {
    loading.value = true;

    var login = AuthLogin(email: ctrlEmail.text, password: ctrlPass.text);
    await repository.authLogin(login).then((auth) {
      loading.value = false;
      if (auth != null) {
        Get.offAllNamed(Routes.HOME);
      }
      //loading.value = false;
    }).catchError((err) {
      print('erro no controller: $err');
    });
  }

  Future<void> loginOnPressedSigaa() async {
    loading.value = true;
    var login =
        AuthLoginSigaa(username: ctrlEmail.text, password: ctrlPass.text);
    await repository.authLoginSigaa(login).then((auth) {
      loading.value = false;
      if (auth != null) {
        //box.write('auth', auth);
        Get.find<WebSocketController>().startStream(AuthToken.token!);
        Get.offAllNamed(Routes.HOME);
      }
      //loading.value = false;
    }).catchError((err) {
      print('erro no controller: $err');
    });
  }
}
