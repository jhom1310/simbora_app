// To parse this JSON data, do
//
//     final rideOffer = rideOfferFromJson(jsonString);

import 'dart:convert';

import 'package:simbora_app/app/data/model/user_model.dart';

RideOffer rideOfferFromJson(String str) => RideOffer.fromJson(json.decode(str));

String rideOfferToJson(RideOffer data) => json.encode(data.toJson());

class RideOffer {
  RideOffer({
    required this.id,
    required this.owner,
    required this.passengers,
    required this.departurePlace,
    required this.destination,
    required this.dates,
    required this.status,
    required this.createdAt,
    required this.updateAt,
    required this.route,
  });

  int id;
  User owner;
  List<User> passengers;
  DeparturePlace departurePlace;
  DeparturePlace destination;
  List<DateTime> dates;
  int status;
  DateTime createdAt;
  DateTime updateAt;
  String route;

  factory RideOffer.fromJson(Map<String, dynamic> json) => RideOffer(
        id: json["id"],
        owner: User.fromJson(json["owner"]),
        passengers:
            List<User>.from(json["passengers"].map((x) => User.fromJson(x))),
        departurePlace: DeparturePlace.fromJson(json["departure_place"]),
        destination: DeparturePlace.fromJson(json["destination"]),
        dates: List<DateTime>.from(json["dates"].map((x) => DateTime.parse(x))),
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updateAt: DateTime.parse(json["updateAt"]),
        route: json["route"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "owner": owner.toJson(),
        "passengers": List<dynamic>.from(passengers.map((x) => x.toJson())),
        "departure_place": departurePlace.toJson(),
        "destination": destination.toJson(),
        "dates": List<dynamic>.from(dates.map((x) => x.toIso8601String())),
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updateAt": updateAt.toIso8601String(),
        "route": route,
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
