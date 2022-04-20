import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/user_model.dart';
import 'package:simbora_app/app/modules/home/controllers/home_controller.dart';
import 'package:simbora_app/app/routes/app_pages.dart';

class DrawerCustom extends StatelessWidget {
  static const padding = EdgeInsets.symmetric(horizontal: 20);
  final User? user;
  const DrawerCustom({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Drawer(
      child: Material(
        color: Color(0xffffCB05),
        child: ListView(
          children: <Widget>[
            buildHeader(
                urlImage: user!.avatar,
                name: user!.firstName,
                email: user!.email,
                curso: user!.curso,
                matricula: user!.matricula,
                onClicked: () => {}),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Divider(color: Colors.black),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Meu Local de Encontro',
                    icon: CupertinoIcons.location,
                    onClicked: () => Get.toNamed(Routes.MY_RIDEOFFER),
                  ),
                  buildMenuItem(
                    text: 'Minhas Caronas',
                    icon: CupertinoIcons.car_detailed,
                    onClicked: () => Get.toNamed(Routes.MY_RIDEOFFER),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Sair',
                    icon: Icons.exit_to_app,
                    onClicked: () {
                      controller.logoutOnPressed();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required String curso,
    required String matricula,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 180,
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: 180,
                    child: Text(
                      email,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 180,
                    child: Text(
                      curso,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 180,
                    child: Text(
                      matricula,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: Text(
        text,
      ),
      onTap: onClicked,
    );
  }
}
