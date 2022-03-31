import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/user_model.dart';
import 'package:simbora_app/app/global/controllers/global_user_info_controller.dart';
import 'package:simbora_app/app/global/widgets/drawer_custom.dart';
import 'package:simbora_app/app/global/widgets/navigation_drawer.dart';
import 'package:simbora_app/app/modules/home/controllers/home_controller.dart';

class MyTopBar extends StatefulWidget {
  final Widget body1, body2;
  const MyTopBar({
    Key? key,
    required this.body1,
    required this.body2,
  }) : super(key: key);

  @override
  _MyTabbedPageState createState() => new _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTopBar>
    with SingleTickerProviderStateMixin {
  final controller = Get.find<HomeController>();
  final globalController = Get.find<GlobalUserInfoController>();

  @override
  void initState() {
    super.initState();
    controller.tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller.tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final User? userSession = globalController.getSession;
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerCustom(
        user: userSession,
      ),
      appBar: AppBar(
        //toolbarHeight: 4,
        elevation: 0,
        //backgroundColor: Colors.yellow,
        leading: IconButton(
          icon: Icon(
            Icons.person,
            color: Colors.black,
          ),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),

        title: Text(
          'SIMBORA',
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: controller.tabController,
          tabs: [
            Container(
              alignment: Alignment.center,
              height: 50,
              child: Text("Ofertas de Carona"),
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              child: Text("Solicitações de Carona"),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [widget.body1, widget.body2],
      ),
    );
  }
}
