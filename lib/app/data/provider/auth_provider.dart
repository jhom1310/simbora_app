import 'dart:convert';
import 'package:get/get_connect.dart';
import 'package:simbora_app/app/data/model/login_model.dart';
import 'package:simbora_app/app/data/model/login_sigaa_model.dart';
import 'package:simbora_app/app/data/model/register_model.dart';
import 'package:simbora_app/app/data/provider/headers.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../env.dart';

class AuthConnect extends GetConnect {
  ///Login
  Future<Response> login(AuthLogin authLogin) async {
    Get.log('Content: ' + authLogin.toJson().toString());
    final response = await post(
        BASE_URL + '/rest-auth/login/', authLogin.toJson(),
        contentType: 'application/json; charset=utf-8');
    Get.log(response.body.toString());

    return response;
  }

  Future<Response> loginSigaa(AuthLoginSigaa authLogin) async {
    Get.log('Content: ' + authLogin.toJson().toString());
    final response = await post(
        BASE_URL + '/rest-auth/loginSigaa/', authLogin.toJson(),
        contentType: 'application/json; charset=utf-8');
    Get.log(response.body.toString());

    return response;
  }

  ///Create User
  Future<Response> createAccount(AuthRegister userProfile) async {
    Get.log('Content: ' + userProfile.toJson().toString());
    final response =
        await post(BASE_URL + '/rest-auth/registration/', userProfile.toJson());
    Get.log(response.body.toString());

    return response;
  }

  ///Reset password
  Future<Response> resetPassword(String email) async {
    Get.log('Content: ' + email);
    String _emailJson = json.encode({"email": email});
    final response =
        await post(BASE_URL + '/rest-auth/password/reset/', _emailJson);
    Get.log(response.body.toString());

    return response;
  }

  Future<Response> logout() async {
    final response = await post(BASE_URL + '/rest-auth/logout/', null,
        headers: Headers.headers);

    return response;
  }
}
