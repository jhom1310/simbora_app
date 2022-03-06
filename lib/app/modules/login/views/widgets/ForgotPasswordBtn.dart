import 'package:flutter/material.dart';
import 'package:simbora_app/app/utils/constants.dart';

class ForgotPasswordBtn extends StatelessWidget {
  const ForgotPasswordBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Esqueceu sua senha?',
          style: gLabelStyle,
        ),
      ),
    );
  }
}
