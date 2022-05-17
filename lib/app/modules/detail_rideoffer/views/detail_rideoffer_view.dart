import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/user_model.dart';
import 'package:simbora_app/app/global/controllers/global_user_info_controller.dart';
import 'package:simbora_app/app/routes/app_pages.dart';
import 'package:intl/intl.dart';
import '../controllers/detail_rideoffer_controller.dart';

class DetailRideofferView extends GetView<DetailRideofferController> {
  @override
  Widget build(BuildContext context) {
    final globalUserController = Get.find<GlobalUserInfoController>();
    final activeuser = globalUserController.getSession;
    bool isPassenger;
    var contain = controller.rideoffer.value.passengers
        .where((element) => element.id == activeuser!.id);
    if (contain.isEmpty) {
      isPassenger = false;
    } else {
      isPassenger = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Carona'),
        centerTitle: true,
        actions: [
          isPassenger
              ? IconButton(
                  onPressed: () => Get.toNamed(Routes.CHAT,
                      arguments: controller.rideoffer.value),
                  icon: Icon(Icons.message),
                )
              : activeuser!.id == controller.rideoffer.value.owner.id
                  ? Container()
                  : IconButton(
                      onPressed: () {
                        showModelRequest(context);
                      },
                      icon: Icon(Icons.person_add),
                    ),
          activeuser!.id == controller.rideoffer.value.owner.id
              ? Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.CREATE_RIDEOFFER,
                              arguments: controller.rideoffer);
                        },
                        icon: Icon(
                          Icons.edit,
                        )),
                    IconButton(
                        onPressed: () => Get.toNamed(Routes.REQUESTS_FOR_RIDE,
                                arguments: [
                                  controller.rideoffer.value,
                                  controller.routelatlng
                                ]),
                        icon: Icon(Icons.notifications)),
                    IconButton(
                      onPressed: () => Get.toNamed(Routes.CHAT,
                          arguments: controller.rideoffer.value),
                      icon: Icon(Icons.message),
                    ),
                  ],
                )
              : Container()
        ],
      ),
      body: Obx(
        () => ListView(
          children: [
            SizedBox(
              height: Get.height * 0.5,
              child: Stack(
                children: [
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
                        attributionBuilder: (_) {
                          return Text("© OpenStreetMap contributors");
                        },
                      ),
                      MarkerLayerOptions(
                        markers: [
                          buildMarkerDepartureSelect(
                              controller.pointDeparture.value),
                          buildMarkerDestinationSelect(
                              controller.pointDestination.value),
                          buildMarkerDestinationSelect(
                              controller.pointDestination.value),
                          ...buildMarkerPassengers()
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
                              CupertinoIcons.location_circle_fill,
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
                              CupertinoIcons.flag_circle_fill,
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
                ],
              ),
            ),
            Text(
              ' DATAS:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Card(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                //scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: controller.rideoffer.value.dates.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Text(
                    DateFormat("dd-MM-yyyy")
                        .add_Hms()
                        .format(controller.rideoffer.value.dates[index]),
                  );
                },
              ),
            ),
            Text(
              ' MOTORISTA:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Card(child: buildUserCard(controller.rideoffer.value.owner)),
            Text(
              ' PASSAGEIROS:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            controller.rideoffer.value.passengers.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    shrinkWrap: true,
                    itemCount: controller.rideoffer.value.passengers.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Card(
                        child: buildUserCard(
                          controller.rideoffer.value.passengers[index],
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text('Sem passageiros até agora'),
                  ),
          ],
        ),
      ),
    );
  }

  Widget buildModalRequest() {
    return Container();
  }

  Widget buildUserCard(User user) {
    final globalUserController = Get.find<GlobalUserInfoController>();
    final activeuser = globalUserController.getSession;
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(user.avatar),
              backgroundColor: Colors.transparent,
            ),
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
          SizedBox(
            width: 20,
          ),
          activeuser!.id == controller.rideoffer.value.owner.id
              ? activeuser.id == user.id
                  ? Container()
                  : Container(
                      child: IconButton(
                        icon: Icon(
                          CupertinoIcons.xmark_circle,
                          color: Colors.red,
                          size: 30.0,
                        ),
                        onPressed: () {
                          controller.removePassenger(
                              user, controller.rideoffer.value);
                        },
                      ),
                    )
              : Container(),
        ],
      ),
    );
  }

  Marker buildMarkerDepartureSelect(point) {
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

  Marker buildMarkerRequestSelect(point) {
    return Marker(
      point: point,
      builder: (ctx) => Container(
        child: Icon(
          CupertinoIcons.stop_circle_fill,
          color: Colors.orange,
          size: 30.0,
        ),
      ),
    );
  }

  List<Marker> buildMarkerPassengers() {
    List<Marker> markers = List.empty(growable: true);
    var locations = controller.getPassengersLocations();
    for (var item in locations) {
      markers.add(Marker(
        point: item,
        builder: (ctx) => Container(
          child: Icon(
            CupertinoIcons.stop_circle_fill,
            color: Colors.orange,
            size: 30.0,
          ),
        ),
      ));
    }

    return markers;
  }

  Marker buildMarkerDestinationSelect(point) {
    return Marker(
      point: point,
      builder: (ctx) => Container(
        child: Icon(
          CupertinoIcons.flag_circle_fill,
          color: Colors.red,
          size: 30.0,
        ),
      ),
    );
  }

  showModelRequest(context) {
    return showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: Get.height * 0.6,
        child: Column(
          children: [
            Text(
              "Informe o local que deseja pegar a carona:",
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: Get.height * 0.51,
              child: Obx(
                () => FlutterMap(
                  options: MapOptions(
                    onTap: (tapPosition, point) => {
                      controller.pointDepartureRequest.value = point,
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
                        buildMarkerDepartureSelect(
                            controller.pointDeparture.value),
                        buildMarkerDestinationSelect(
                            controller.pointDestination.value),
                        buildMarkerRequestSelect(
                            controller.pointDepartureRequest.value),
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
              ),
            ),
            Container(
              width: Get.width,
              child: ElevatedButton(
                  onPressed: () {
                    controller.addOnPressed();
                  },
                  child: Text('Enviar Solicitação')),
            )
          ],
        ),
      ),
    );
  }
}
