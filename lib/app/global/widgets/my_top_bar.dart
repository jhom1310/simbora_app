import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 4,
        elevation: 0,
        backgroundColor: Colors.white12,
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
