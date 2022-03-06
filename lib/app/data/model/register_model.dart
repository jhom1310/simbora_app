// To parse this JSON data, do
//
//     final authRegister = authRegisterFromJson(jsonString);

import 'dart:convert';

AuthRegister authRegisterFromJson(String str) =>
    AuthRegister.fromJson(json.decode(str));

String authRegisterToJson(AuthRegister data) => json.encode(data.toJson());

class AuthRegister {
  AuthRegister({
    required this.email,
    required this.password1,
    required this.password2,
    required this.nickname,
    required this.firstName,
    required this.lastName,
    required this.curso,
    required this.matricula,
    required this.nivel,
  });

  String email;
  String password1;
  String password2;
  String nickname;
  String firstName;
  String lastName;
  String curso;
  String matricula;
  String nivel;

  factory AuthRegister.fromJson(Map<String, dynamic> json) => AuthRegister(
        email: json["email"],
        password1: json["password1"],
        password2: json["password2"],
        nickname: json["nickname"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        curso: json["curso"],
        matricula: json["matricula"],
        nivel: json["nivel"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password1": password1,
        "password2": password2,
        "nickname": nickname,
        "first_name": firstName,
        "last_name": lastName,
        "curso": curso,
        "matricula": matricula,
        "nivel": nivel,
      };
}
