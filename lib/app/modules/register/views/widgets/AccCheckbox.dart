import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simbora_app/app/modules/register/controllers/register_controller.dart';
import 'package:simbora_app/app/utils/constants.dart';

class AccCheckbox extends StatelessWidget {
  const AccCheckbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();
    return Container(
      height: 40.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(
              unselectedWidgetColor: Colors.grey,
            ),
            child: Obx(() => Checkbox(
                  value: controller.rememberMe.value,
                  checkColor: Colors.grey,
                  activeColor: Colors.white,
                  onChanged: (value) {
                    controller.toggleCheckBox();
                  },
                )),
          ),
          Text(
            'Ao continuar, você aceita nossa\n Política de Privacidade e Termos de Uso',
            style: g2LabelStyle,
          ),
        ],
      ),
    );
  }
}
