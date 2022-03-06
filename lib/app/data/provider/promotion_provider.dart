import 'dart:convert';
import 'package:get/get_connect.dart';
import 'package:simbora_app/app/data/model/login_model.dart';
import 'package:simbora_app/app/data/model/promotion_model.dart';
import 'package:simbora_app/app/data/model/register_model.dart';
import 'package:simbora_app/app/data/provider/headers.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../env.dart';

class PromotionConnect extends GetConnect {
  ///Login
  Future<Response> getAll() async {
    final response = await get(BASE_URL + '/api/promotion/',
        headers: Headers.headers,
        contentType: 'application/json; charset=utf-8');
    Get.log('Requisitando linsta de Promoções');

    return response;
  }

  Future<Response> getAllOrderScore() async {
    final response = await get(BASE_URL + '/api/promotionscore/',
        headers: Headers.headers,
        contentType: 'application/json; charset=utf-8');
    Get.log('Requisitando linsta de Promoções ordenadas por Score');

    return response;
  }

  Future<Response> createPromotion(Promotion promotion) async {
    Get.log('Content: ' + promotion.toJson().toString());
    final response = await post(
      BASE_URL + '/api/promotion/',
      promotion.toJson(),
      headers: Headers.headers,
    );
    Get.log(response.body.toString());
    return response;
  }
}
