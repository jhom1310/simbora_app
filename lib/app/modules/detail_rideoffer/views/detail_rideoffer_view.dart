import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/user_model.dart';
import 'package:simbora_app/app/global/controllers/global_user_info_controller.dart';

import '../controllers/detail_rideoffer_controller.dart';

class DetailRideofferView extends GetView<DetailRideofferController> {
  @override
  Widget build(BuildContext context) {
    final globalUserController = Get.find<GlobalUserInfoController>();
    final activeuser = globalUserController.getSession;
    return Scaffold(
      appBar: AppBar(
        title: Text('Carona'),
        centerTitle: true,
        actions: [
          activeuser!.id == controller.rideoffer.owner.id
              ? IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
              : IconButton(onPressed: () {}, icon: Icon(Icons.person_add))
        ],
      ),
      body: ListView(
        children: [
          Obx(
            () => SizedBox(
              height: Get.height * 0.5,
              child: Stack(children: [
                FlutterMap(
                  options: MapOptions(
                    center: controller.pointDeparture.value,
                    zoom: 15.0,
                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                    ),
                    MarkerLayerOptions(
                      markers: [
                        buildMarkerDepartureSelect(
                            controller.pointDeparture.value),
                        buildMarkerDestinationSelect(
                            controller.pointDestination.value),
                        //
                      ],
                    ),
                    PolylineLayerOptions(polylines: [
                      Polyline(
                        points: controller.routelatlng,
                        strokeWidth: 2.0,
                        color: Colors.red,
                      ),
                    ]),
                  ],
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.placemark_fill,
                            color: Colors.green,
                          ),
                          Text(
                            "- PARTIDA",
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.stop_circle_outlined,
                            color: Colors.red,
                          ),
                          Text(
                            "- DESTINO",
                          )
                        ],
                      )
                    ],
                  ),
                )
              ]),
            ),
          ),
          Text(
            ' MOTORISTA:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Card(child: buildUserCard(controller.rideoffer.owner)),
          Text(
            ' PASSAGEIROS:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          controller.rideoffer.passengers.isNotEmpty
              ? ListView.builder(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  shrinkWrap: true,
                  itemCount: controller.rideoffer.passengers.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      child: buildUserCard(
                        controller.rideoffer.passengers[index],
                      ),
                    );
                  },
                )
              : Center(
                  child: Text('Sem passageiros até agora'),
                ),
        ],
      ),
    );
  }

  Widget buildUserCard(User user) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(user.avatar),
            backgroundColor: Colors.transparent,
          ),
          Container(
            width: Get.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  user.firstName,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  'Curso: ${user.curso}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Marker buildMarkerDepartureSelect(point) {
    return Marker(
      point: point,
      builder: (ctx) => Container(
        child: Icon(
          CupertinoIcons.placemark_fill,
          color: Colors.green,
          size: 30.0,
        ),
      ),
    );
  }

  Marker buildMarkerDestinationSelect(point) {
    return Marker(
      point: point,
      builder: (ctx) => Container(
        child: Icon(
          Icons.stop_circle_outlined,
          color: Colors.red,
          size: 30.0,
        ),
      ),
    );
  }
}
