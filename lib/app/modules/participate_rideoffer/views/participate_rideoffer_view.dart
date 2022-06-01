import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/ride_offer_model.dart';
import 'package:simbora_app/app/global/widgets/item_rideoffer.dart';

import '../controllers/participate_rideoffer_controller.dart';

class ParticipateRideofferView extends GetView<ParticipateRideofferController> {
  @override
  Widget build(BuildContext context) {
    Future<List<RideOffer>> list = controller.getMyRideOffer();
    return Scaffold(
      appBar: AppBar(
        title: Text('Caronas que sou passageiro'),
        centerTitle: true,
      ),
      body: Container(
        height: Get.height * 0.74,
        child: FutureBuilder<List<RideOffer>>(
          future: list,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.orange,
                ));
              case ConnectionState.done:
                if (snapshot.hasData) {
                  final List<RideOffer> rideofferList = snapshot.data!;

                  if (rideofferList.isNotEmpty) {
                    return ListView.builder(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      shrinkWrap: true,
                      itemCount: rideofferList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ItemRideOffer(
                            rideoffer: rideofferList[index],
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                        child: Text('Lista de Ofertas de Carona vazia'));
                  }
                }
                break;
              default:
                break;
            }
            return Center(child: Text('Erro desconhecido'));
          },
        ),
      ),
    );
  }
}
