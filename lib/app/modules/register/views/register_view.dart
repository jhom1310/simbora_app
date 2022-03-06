import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:simbora_app/app/global/widgets/InputTF.dart';
import 'package:simbora_app/app/global/widgets/loginBtn.dart';
import 'package:simbora_app/app/global/widgets/passwordTF.dart';

import 'package:simbora_app/app/modules/register/controllers/register_controller.dart';
import 'package:simbora_app/app/modules/register/views/widgets/AccCheckbox.dart';
import 'package:simbora_app/app/modules/register/views/widgets/SignupBtn.dart';
import 'package:simbora_app/app/utils/validators.dart';

class RegisterView extends GetView<RegisterController> {
  final controller = Get.find<RegisterController>();

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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Cadastrar',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      InputTF(
                        icon: Icon(Icons.email, color: Colors.grey),
                        text: 'Email',
                        validator: (email) => emailValidator(email),
                        ctrlText: controller.ctrlEmail,
                      ),
                      InputTF(
                        icon: Icon(Icons.person, color: Colors.grey),
                        text: 'Nickname',
                        validator: (name) => nameValidator(name),
                        ctrlText: controller.ctrlNickname,
                      ),
                      InputTF(
                        icon: Icon(Icons.person, color: Colors.grey),
                        text: 'Nome',
                        ctrlText: controller.ctrlFirst_name,
                        validator: (name) => nameValidator(name),
                      ),
                      InputTF(
                        icon: Icon(Icons.person, color: Colors.grey),
                        text: 'Sobrenome',
                        validator: (name) => nameValidator(name),
                        ctrlText: controller.ctrlLast_name,
                      ),
                      InputTF(
                        icon: Icon(Icons.book, color: Colors.grey),
                        text: 'Curso',
                        validator: (name) => nameValidator(name),
                        ctrlText: controller.ctrlCurso,
                      ),
                      InputTF(
                        icon: Icon(Icons.app_registration, color: Colors.grey),
                        text: 'Matricula',
                        validator: (name) => nameValidator(name),
                        ctrlText: controller.ctrlMatricula,
                      ),
                      InputTF(
                        icon: Icon(Icons.grading_outlined, color: Colors.grey),
                        text: 'Nivel (ex: Graduação)',
                        validator: (name) => nameValidator(name),
                        ctrlText: controller.ctrlNivel,
                      ),
                      PasswordTF(
                        controller: controller,
                        text: 'Senha',
                        ctrlText: controller.ctrlPass,
                        validator: (password) => passwordValidator(password),
                      ),
                      PasswordTF(
                        controller: controller,
                        text: 'Confirmar Senha',
                        ctrlText: controller.ctrlPass2,
                        validator: (password) => passwordValidator(password),
                      ),
                      SizedBox(height: 10.0),
                      AccCheckbox(),
                      LoginBtn(
                        text: 'Cadastrar',
                        onPressed: () {
                          controller.registerOnPressed();
                        },
                      ),
                      SignupBtn(),
                    ],
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
