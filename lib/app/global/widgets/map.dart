import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapCustom extends StatelessWidget {
  final List route;

  const MapCustom({
    Key? key,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(-5.203293, -37.32555),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
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
                  CupertinoIcons.location_circle_fill,
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
                  CupertinoIcons.flag_circle_fill,
                  color: Colors.red,
                  size: 24.0,
                ),
              ),
            ),
          ],
        ),
        PolylineLayerOptions(polylines: [
          Polyline(
            points: buildRoute(route),
            strokeWidth: 2.0,
            color: Colors.red,
          ),
        ]),
      ],
    );
  }

  List<LatLng> buildRoute(List route) {
    List<LatLng> points = [];
    for (var point in route) {
      points.add(LatLng(point[1], point[0]));
    }
    return points;
  }
}
