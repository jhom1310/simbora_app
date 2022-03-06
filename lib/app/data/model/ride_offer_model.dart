// To parse this JSON data, do
//
//     final rideOffer = rideOfferFromJson(jsonString);

import 'dart:convert';

RideOffer rideOfferFromJson(String str) => RideOffer.fromJson(json.decode(str));

String rideOfferToJson(RideOffer data) => json.encode(data.toJson());

class RideOffer {
  RideOffer({
    required this.id,
    required this.departurePlace,
    required this.destination,
    required this.departureTime,
    required this.status,
    required this.createdAt,
    required this.updateAt,
    required this.route,
    required this.owner,
    required this.passengers,
  });

  int id;
  DeparturePlace departurePlace;
  DeparturePlace destination;
  DateTime departureTime;
  int status;
  DateTime createdAt;
  DateTime updateAt;
  String route;
  int owner;
  List<int> passengers;

  factory RideOffer.fromJson(Map<String, dynamic> json) => RideOffer(
        id: json["id"],
        departurePlace: DeparturePlace.fromJson(json["departure_place"]),
        destination: DeparturePlace.fromJson(json["destination"]),
        departureTime: DateTime.parse(json["departure_time"]),
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updateAt: DateTime.parse(json["updateAt"]),
        route: json["route"],
        owner: json["owner"],
        passengers: List<int>.from(json["passengers"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "departure_place": departurePlace.toJson(),
        "destination": destination.toJson(),
        "departure_time": departureTime.toIso8601String(),
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updateAt": updateAt.toIso8601String(),
        "route": route,
        "owner": owner,
        "passengers": List<dynamic>.from(passengers.map((x) => x)),
      };
}

class DeparturePlace {
  DeparturePlace({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<double> coordinates;

  factory DeparturePlace.fromJson(Map<String, dynamic> json) => DeparturePlace(
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}
