import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simbora_app/app/modules/login/controllers/login_controller.dart';
import 'package:simbora_app/app/utils/constants.dart';

class RememberMeCheckbox extends StatelessWidget {
  const RememberMeCheckbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Container(
      height: 20.0,
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
            'Manter conectado',
            style: g2LabelStyle,
          ),
        ],
      ),
    );
  }
}
