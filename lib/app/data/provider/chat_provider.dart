import 'package:get/get_connect.dart';
import 'package:simbora_app/app/data/model/message_model.dart';

import 'package:simbora_app/app/data/model/promotion_model.dart';
import 'package:simbora_app/app/data/model/ride_offer_model.dart';
import 'package:simbora_app/app/data/model/user_model.dart';

import 'package:simbora_app/app/data/provider/headers.dart';

import 'package:get/get_core/src/get_main.dart';

import '../../../env.dart';

class ChatConnect extends GetConnect {
  ///Login
  Future<Response> getAllfromRide(RideOffer ride) async {
    final response = await get(BASE_URL + '/api/messageride/?ride=${ride.id}',
        headers: Headers.headers,
        contentType: 'application/json; charset=utf-8');
    Get.log('Requisitando lista de Menssagens');

    return response;
  }

  Future<Response> createMessage(MessageRide message) async {
    Get.log('Content: ' + message.toJson().toString());
    final response = await post(
      BASE_URL + '/api/messageride/',
      message.toJson(),
      headers: Headers.headers,
    );
    Get.log(response.body.toString());
    return response;
  }
}
