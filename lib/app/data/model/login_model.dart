// To parse this JSON data, do
//
//     final authLogin = authLoginFromJson(jsonString);

import 'dart:convert';

AuthLogin authLoginFromJson(String str) => AuthLogin.fromJson(json.decode(str));

String authLoginToJson(AuthLogin data) => json.encode(data.toJson());

class AuthLogin {
  AuthLogin({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  factory AuthLogin.fromJson(Map<String, dynamic> json) => AuthLogin(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
