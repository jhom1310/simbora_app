// To parse this JSON data, do
//
//     final authLogin = authLoginFromJson(jsonString);

import 'dart:convert';

AuthLoginSigaa authLoginFromJson(String str) =>
    AuthLoginSigaa.fromJson(json.decode(str));

String authLoginToJson(AuthLoginSigaa data) => json.encode(data.toJson());

class AuthLoginSigaa {
  AuthLoginSigaa({
    required this.username,
    required this.password,
  });

  String username;
  String password;

  factory AuthLoginSigaa.fromJson(Map<String, dynamic> json) => AuthLoginSigaa(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
