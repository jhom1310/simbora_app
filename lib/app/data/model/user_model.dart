// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:simbora_app/app/data/repository/user_repository.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.nickname,
    required this.curso,
    required this.matricula,
    required this.nivel,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String nickname;
  String curso;
  String matricula;
  String nivel;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        nickname: json["nickname"],
        curso: json["curso"],
        matricula: json["matricula"],
        nivel: json["nivel"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "nickname": nickname,
        "curso": curso,
        "matricula": matricula,
        "nivel": nivel,
      };
}
