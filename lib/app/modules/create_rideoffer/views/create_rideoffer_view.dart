import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../controllers/create_rideoffer_controller.dart';
import 'package:latlong2/latlong.dart';

class CreateRideofferView extends GetView<CreateRideofferController> {
  final controller = Get.find<CreateRideofferController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Oferta de Carona'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                controller.addOnPressed();
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
                onLongPress: (tapPosition, point) => {
                  controller.pointDestination.value = point,
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
                    buildMarkerDestinationSelect(
                        controller.pointDestination.value),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, Get.height * 0.46, 8, 0),
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
                      "Clique para selecionar local de partida;",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Pressione para selecionar local de destino.",
                      style: TextStyle(fontSize: 18),
                    ),
                    Divider(),
                    Text(
                      "Selecione os dias que a corana vai ocorrer:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Container(
                      height: Get.height * 0.25,
                      margin: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54)),
                      child: SfDateRangePicker(
                        enablePastDates: false,
                        onSelectionChanged: controller.onSelectionChanged,
                        view: DateRangePickerView.month,
                        todayHighlightColor: Colors.black,
                        selectionColor: Colors.orange,
                        rangeSelectionColor: Colors.orange,
                        startRangeSelectionColor: Colors.deepOrange,
                        endRangeSelectionColor: Colors.deepOrange,
                        monthViewSettings: DateRangePickerMonthViewSettings(
                          firstDayOfWeek: 1,
                        ),
                        selectionMode: DateRangePickerSelectionMode.multiple,
                      ),
                    ),
                  ],
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
          CupertinoIcons.location_circle_fill,
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
          CupertinoIcons.flag_circle_fill,
          color: Colors.red,
          size: 30.0,
        ),
      ),
    );
  }
}
