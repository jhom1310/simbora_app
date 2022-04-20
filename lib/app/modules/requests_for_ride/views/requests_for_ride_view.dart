import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/request_for_ride.dart';

import '../controllers/requests_for_ride_controller.dart';

class RequestsForRideView extends GetView<RequestsForRideController> {
  @override
  Widget build(BuildContext context) {
    var list = controller.getRequestForRide();
    return Scaffold(
      appBar: AppBar(
        title: Text('Solicitações'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<RequestForRide>>(
        future: list,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.orange,
              ));
            case ConnectionState.done:
              if (snapshot.hasData) {
                final List<RequestForRide> requestforrideList = snapshot.data!;

                if (requestforrideList.isNotEmpty) {
                  return ListView.builder(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    shrinkWrap: true,
                    itemCount: requestforrideList.length,
                    itemBuilder: (context, index) {
                      return buildCard(requestforrideList[index]);
                    },
                  );
                } else {
                  return Center(
                      child: Text('Lista de Ofertas de Carona vazia'));
                }
              }
              break;
            default:
              break;
          }
          return Center(child: Text('Erro desconhecido'));
        },
      ),
    );
  }

  Marker buildMarkerDeparture(point) {
    return Marker(
      point: point,
      builder: (ctx) => Container(
        child: Icon(
          CupertinoIcons.location_circle_fill,
          color: Colors.green,
          size: 30.0,
        ),
      ),
    );
  }

  Widget buildCard(
    RequestForRide request,
  ) {
    return Card(
      child: Container(
        height: Get.height * 0.35,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(request.sender.avatar),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: Get.width * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          request.sender.firstName,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(request.sender.curso)
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.acceptRequest(request);
                    },
                    icon: Icon(
                      CupertinoIcons.check_mark_circled,
                      size: 30.0,
                      color: Colors.green,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.rejectRequest(request);
                    },
                    icon: Icon(
                      CupertinoIcons.xmark_circle,
                      size: 30.0,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              SizedBox(
                height: Get.height * 0.22,
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(
                      request.location.coordinates[1],
                      request.location.coordinates[0],
                    ),
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
                        buildMarkerDeparture(LatLng(
                          request.location.coordinates[1],
                          request.location.coordinates[0],
                        )),

                        //
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
