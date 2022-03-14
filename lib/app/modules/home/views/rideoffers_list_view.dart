import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/ride_offer_model.dart';
import 'package:simbora_app/app/global/widgets/item_rideoffer.dart';
import 'package:simbora_app/app/modules/home/controllers/home_controller.dart';

class RideOfferList extends StatelessWidget {
  const RideOfferList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    var list = controller.getRideOffer();
    return FutureBuilder<List<RideOffer>>(
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
                return Center(child: Text('Lista de Ofertas de Carona vazia'));
              }
            }
            break;
          default:
            break;
        }
        return Center(child: Text('Erro desconhecido'));
      },
    );
  }
}
