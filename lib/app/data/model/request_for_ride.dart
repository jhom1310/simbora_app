// To parse this JSON data, do
//
//     final requestForRide = requestForRideFromJson(jsonString);

import 'dart:convert';

import 'package:simbora_app/app/data/model/ride_offer_model.dart';
import 'package:simbora_app/app/data/model/user_model.dart';

List<RequestForRide> requestForRideFromJson(String str) =>
    List<RequestForRide>.from(
        json.decode(str).map((x) => RequestForRide.fromJson(x)));

String requestForRideToJson(List<RequestForRide> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestForRide {
  RequestForRide({
    required this.id,
    required this.sender,
    required this.receiver,
    required this.ride,
    required this.isSeen,
    required this.location,
  });

  int id;
  User sender;
  User receiver;
  RideOffer ride;
  bool isSeen;
  Location location;

  factory RequestForRide.fromJson(Map<String, dynamic> json) => RequestForRide(
        id: json["id"],
        sender: User.fromJson(json["sender"]),
        receiver: User.fromJson(json["receiver"]),
        ride: RideOffer.fromJson(json["ride"]),
        isSeen: json["is_seen"],
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "sender": sender.id,
        "receiver": receiver.id,
        "ride": ride.id,
        "location": location.toJson(),
      };
}

class Location {
  Location({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<double> coordinates;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}
