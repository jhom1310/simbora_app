import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:simbora_app/app/global/widgets/loginBtn.dart';
import 'package:simbora_app/app/utils/validators.dart';
import 'widgets/RememberMeCheckbox.dart';
import 'widgets/SignInWithText.dart';

import '../controllers/login_controller.dart';
import '../../../global/widgets/InputTF.dart';
import 'widgets/ForgotPasswordBtn.dart';
import '../../../global/widgets/passwordTF.dart';
import 'widgets/SignupBtn.dart';

class LoginView extends GetView<LoginController> {
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 55.0,
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Olá,',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          'Bem vindo',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        InputTF(
                          icon: Icon(Icons.person, color: Colors.grey),
                          text: 'Login Sigaa',
                          //controller: controller,
                          ctrlText: controller.ctrlEmail,
                          validator: (email) => emailValidator(email),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        PasswordTF(
                          controller: controller,
                          text: 'Senha Sigaa',
                          ctrlText: controller.ctrlPass,
                          validator: (password) => passwordValidator(password),
                        ),
                        SizedBox(height: 10.0),
                        ForgotPasswordBtn(),
                        RememberMeCheckbox(),
                        Obx(
                          () => controller.loading.value
                              ? CircularProgressIndicator()
                              : LoginBtn(
                                  text: 'Entrar',
                                  onPressed: controller.loginOnPressedSigaa,
                                ),
                        ),
                        SizedBox(height: 10.0),
                        SignupBtn(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
