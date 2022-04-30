// To parse this JSON data, do
//
//     final messageRide = messageRideFromJson(jsonString);

import 'dart:convert';

import 'package:simbora_app/app/data/model/ride_offer_model.dart';
import 'package:simbora_app/app/data/model/user_model.dart';

List<MessageRide> messageRideFromJson(String str) => List<MessageRide>.from(
    json.decode(str).map((x) => MessageRide.fromJson(x)));

String messageRideToJson(List<MessageRide> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MessageRide {
  MessageRide({
    required this.id,
    required this.user,
    required this.ride,
    required this.text,
    required this.createdAt,
  });

  int id;
  User user;
  RideOffer ride;
  String text;
  DateTime createdAt;

  factory MessageRide.fromJson(Map<String, dynamic> json) => MessageRide(
        id: json["id"],
        user: User.fromJson(json["user"]),
        ride: RideOffer.fromJson(json["ride"]),
        text: json["text"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.id,
        "ride": ride.id,
        "text": text,
        //"createdAt": createdAt.toIso8601String(),
      };
}
