import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simbora_app/app/routes/app_pages.dart';

class SignupBtn extends StatelessWidget {
  const SignupBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.offAndToNamed(Routes.LOGIN),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: 'Já tem uma conta? ',
                style: Theme.of(context).textTheme.headline6),
            TextSpan(
              text: 'Login',
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
