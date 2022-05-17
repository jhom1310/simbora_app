// To parse this JSON data, do
//
//     final passengerLocation = passengerLocationFromJson(jsonString);

import 'dart:convert';

PassengerLocation passengerLocationFromJson(String str) =>
    PassengerLocation.fromJson(json.decode(str));

String passengerLocationToJson(PassengerLocation data) =>
    json.encode(data.toJson());

class PassengerLocation {
  PassengerLocation({
    required this.location,
    required this.passenger,
  });

  Location location;
  Passenger passenger;

  factory PassengerLocation.fromJson(Map<String, dynamic> json) =>
      PassengerLocation(
        location: Location.fromJson(json["location"]),
        passenger: Passenger.fromJson(json["passenger"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "passenger": passenger.toJson(),
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

class Passenger {
  Passenger({
    required this.id,
    required this.password,
    required this.lastLogin,
    required this.isSuperuser,
    required this.firstName,
    required this.lastName,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
    required this.email,
    required this.nickname,
    required this.curso,
    required this.matricula,
    required this.nivel,
    required this.avatar,
    required this.groups,
    required this.userPermissions,
  });

  int id;
  String password;
  DateTime lastLogin;
  bool isSuperuser;
  String firstName;
  String lastName;
  bool isStaff;
  bool isActive;
  DateTime dateJoined;
  String email;
  String nickname;
  String curso;
  String matricula;
  String nivel;
  String avatar;
  List<dynamic> groups;
  List<dynamic> userPermissions;

  factory Passenger.fromJson(Map<String, dynamic> json) => Passenger(
        id: json["id"],
        password: json["password"],
        lastLogin: DateTime.parse(json["last_login"]),
        isSuperuser: json["is_superuser"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        isStaff: json["is_staff"],
        isActive: json["is_active"],
        dateJoined: DateTime.parse(json["date_joined"]),
        email: json["email"],
        nickname: json["nickname"],
        curso: json["curso"],
        matricula: json["matricula"],
        nivel: json["nivel"],
        avatar: json["avatar"],
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
        userPermissions:
            List<dynamic>.from(json["user_permissions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
        "last_login": lastLogin.toIso8601String(),
        "is_superuser": isSuperuser,
        "first_name": firstName,
        "last_name": lastName,
        "is_staff": isStaff,
        "is_active": isActive,
        "date_joined": dateJoined.toIso8601String(),
        "email": email,
        "nickname": nickname,
        "curso": curso,
        "matricula": matricula,
        "nivel": nivel,
        "avatar": avatar,
        "groups": List<dynamic>.from(groups.map((x) => x)),
        "user_permissions": List<dynamic>.from(userPermissions.map((x) => x)),
      };
}
