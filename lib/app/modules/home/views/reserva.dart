import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:simbora_app/app/global/global_controller.dart';
import 'package:simbora_app/app/global/widgets/my_top_bar.dart';
import 'package:simbora_app/app/global/widgets/navigation_drawer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  double height = Get.height;
  @override
  Widget build(BuildContext context) {
    final globalcontroller = Get.find<GlobalController>();
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('HomeView'),
          centerTitle: true,
        ),
        body: /* 
       */
            MyTopBar(
          body1: Stack(
            children: [
              FlutterMap(
                options: MapOptions(
                  center: LatLng(-5.203293, -37.32555),
                  zoom: 13.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                    attributionBuilder: (_) {
                      return Text("© OpenStreetMap contributors");
                    },
                  ),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: LatLng(-5.203293, -37.32555),
                        builder: (ctx) => Container(
                          child: Icon(
                            CupertinoIcons.placemark_fill,
                            color: Colors.red,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: LatLng(-5.218444, -37.340479),
                        builder: (ctx) => Container(
                          child: Icon(
                            Icons.stop_circle_outlined,
                            color: Colors.red,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  PolylineLayerOptions(polylines: [
                    Polyline(
                      points: [
                        LatLng(-5.203293, -37.32555),
                        LatLng(-5.209332, -37.333736),
                        LatLng(-5.210205, -37.333206),
                        LatLng(-5.21066, -37.334032),
                        LatLng(-5.21001, -37.334638),
                        LatLng(-5.218444, -37.340479)
                      ],
                      strokeWidth: 2.0,
                      color: Colors.red,
                    ),
                  ]),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, height * 0.63, 8, 0),
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'HomeView is working',
                          style: TextStyle(fontSize: 20),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            globalcontroller.toggleTheme();
                          },
                          child: Obx(() => Text(
                                globalcontroller.txtTheme.value,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          body2: Container(),
        ));
  }
}
