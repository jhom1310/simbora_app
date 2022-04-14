import 'dart:convert';
import 'package:get/get_connect.dart';
import 'package:simbora_app/app/data/model/login_model.dart';
import 'package:simbora_app/app/data/model/promotion_model.dart';
import 'package:simbora_app/app/data/model/register_model.dart';
import 'package:simbora_app/app/data/model/ride_offer_model.dart';
import 'package:simbora_app/app/data/model/user_model.dart';
import 'package:simbora_app/app/data/provider/headers.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../env.dart';

class RideOfferConnect extends GetConnect {
  ///Busca todas as ofertas de carona
  Future<Response> getAllRideOffer(int status) async {
    final response = await get(BASE_URL + '/api/rideoffer?status=$status',
        headers: Headers.headers,
        contentType: 'application/json; charset=utf-8');
    Get.log('Requisitando lista de Ofertas de Carona');

    return response;
  }

  Future<Response> getMyRideOffer(User owner) async {
    final response = await get(BASE_URL + '/api/rideoffer?owner=${owner.id}',
        headers: Headers.headers,
        contentType: 'application/json; charset=utf-8');
    Get.log('Requisitando lista de Ofertas de Carona');

    return response;
  }

  ///Busca uma oferta de carona por id
  Future<Response> getRideOffer(int id) async {
    final response = await get(BASE_URL + '/api/rideoffer/$id',
        headers: Headers.headers,
        contentType: 'application/json; charset=utf-8');
    Get.log(response.body.toString());

    return response;
  }

  Future<Response> createRideOffer(RideOffer rideoffer) async {
    Get.log('Content: ' + rideoffer.toJson().toString());
    final response = await post(
      BASE_URL + '/api/rideoffer/',
      rideoffer.toJson(),
      headers: Headers.headers,
    );
    Get.log(response.body.toString());
    return response;
  }
}
