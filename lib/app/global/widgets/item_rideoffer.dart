import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/ride_offer_model.dart';
import 'package:simbora_app/app/data/model/user_model.dart';
import 'package:simbora_app/app/modules/home/controllers/home_controller.dart';
import 'package:simbora_app/app/routes/app_pages.dart';

class ItemRideOffer extends StatelessWidget {
  final RideOffer rideoffer;
  const ItemRideOffer({
    Key? key,
    required this.rideoffer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: Get.width - 10,
          height: Get.height * 0.16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            /*  boxShadow: [
              BoxShadow(
                color: Color(0x3f000000),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ], */
          ),
          child: Stack(
            children: [
              Positioned(
                child: Row(
                  children: [
                    Text(
                      'Partida: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    FutureBuilder<String>(
                      future: controller.buildAddress(
                        rideoffer.departurePlace.coordinates[0],
                        rideoffer.departurePlace.coordinates[1],
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data!);
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 20,
                child: Row(
                  children: [
                    Text(
                      'Destino: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    FutureBuilder<String>(
                      future: controller.buildAddress(
                        rideoffer.destination.coordinates[0],
                        rideoffer.destination.coordinates[1],
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data!);
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 40,
                child: Row(
                  children: [
                    Text(
                      'Motorista: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(rideoffer.owner.firstName)
                  ],
                ),
              ),
              Positioned(
                bottom: 2,
                right: 2,
                child: Container(
                  //color: Colors.purpleAccent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              print('Favoritou');
                            },
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 90,
                            ),
                            child: RaisedButton(
                              elevation: 5.00,
                              onPressed: () {
                                Get.toNamed(Routes.HOME, arguments: rideoffer);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              padding: const EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                    colors: [
                                      Color(0xfffd7d06),
                                      Color(0xfffeb105),
                                      Color(0xfffdff02),
                                    ],
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(80.0)),
                                ),
                                child: Container(
                                  constraints: const BoxConstraints(
                                      minWidth: 88.0,
                                      minHeight:
                                          36.0), // min sizes for Material buttons
                                  alignment: Alignment.center,
                                  child: Text(
                                    'DETALHES',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ], //Chi
          ),
        ),
      ],
    );
  }
}
