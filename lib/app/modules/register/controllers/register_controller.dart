import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/register_model.dart';
import 'package:simbora_app/app/data/model/user_model.dart';
import 'package:simbora_app/app/data/repository/auth_repository.dart';

class RegisterController extends GetxController {
  final repository = Get.find<AuthRepository>();

  final _createUserFormKey = GlobalKey<FormState>();
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlNickname = TextEditingController();
  TextEditingController ctrlFirst_name = TextEditingController();
  TextEditingController ctrlLast_name = TextEditingController();
  TextEditingController ctrlPass = TextEditingController();
  TextEditingController ctrlPass2 = TextEditingController();
  TextEditingController ctrlCurso = TextEditingController();
  TextEditingController ctrlMatricula = TextEditingController();
  TextEditingController ctrlNivel = TextEditingController();

  final rememberMe = false.obs;
  final show = true.obs;
  final showIcon = Icons.visibility_off.obs;

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

  Future<void> registerOnPressed() async {
    AuthRegister user = AuthRegister(
      email: ctrlEmail.text,
      firstName: ctrlFirst_name.text,
      lastName: ctrlLast_name.text,
      nickname: ctrlNickname.text,
      password1: ctrlPass.text,
      password2: ctrlPass2.text,
      curso: ctrlCurso.text,
      matricula: ctrlMatricula.text,
      nivel: ctrlNivel.text,
    );
    await repository.authCreateUser(user);
  }
}
