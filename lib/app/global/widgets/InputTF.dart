import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simbora_app/app/utils/constants.dart';

class InputTF extends StatelessWidget {
  final Icon icon;
  final String text;
  //inal controller;
  final ctrlText;
  final validator;

  const InputTF({
    Key? key,
    required this.icon,
    required this.text,
    //required this.controller,
    required this.ctrlText,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextFormField(
            controller: ctrlText,
            validator: validator,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: icon,
              hintText: text,
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
