import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simbora_app/app/routes/app_pages.dart';

class SignupBtn extends StatelessWidget {
  const SignupBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.offAndToNamed(Routes.REGISTER),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: 'Não tem uma conta? ',
                style: Theme.of(context).textTheme.headline6),
            TextSpan(
              text: 'Cadastrar',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
