import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_location_controller.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';

class MyLocationView extends GetView<MyLocationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Oferta de Carona'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                controller.setLocationUser();
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Stack(
        children: [
          Obx(
            () => FlutterMap(
              options: MapOptions(
                onTap: (tapPosition, point) => {
                  controller.pointDeparture.value = point,
                },
                center: LatLng(
                  controller.globalcontroller.userPosition.latitude,
                  controller.globalcontroller.userPosition.longitude,
                ),
                zoom: 15.0,
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
                    buildMarkerDepartureSelect(controller.pointDeparture.value),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, Get.height * 0.78, 8, 0),
            child: Container(
              width: Get.width,
              height: 40.0,
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Toque no mapa para escolher seu local de encontro',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
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
}
