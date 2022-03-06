import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:torandoproject/app/modules/login/controllers/login_controller.dart';
import 'package:simbora_app/app/utils/constants.dart';

// ignore: must_be_immutable
class PasswordTF extends StatelessWidget {
  final controller;
  final String text;
  final ctrlText;
  final validator;

  PasswordTF({
    Key? key,
    required this.controller,
    required this.text,
    required this.ctrlText,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final controller = Get.find<LoginController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: Obx(() => TextFormField(
                controller: ctrlText,
                validator: validator,
                obscureText: controller.show.value,
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.showIcon.value,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      controller.showPassword();
                    },
                  ),
                  hintText: text,
                  hintStyle: kHintTextStyle,
                ),
              )),
        ),
      ],
    );
  }
}
