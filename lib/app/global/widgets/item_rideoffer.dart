import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/ride_offer_model.dart';
import 'package:simbora_app/app/modules/home/controllers/home_controller.dart';
import 'package:simbora_app/app/routes/app_pages.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ItemRideOffer extends StatelessWidget {
  final RideOffer rideoffer;
  const ItemRideOffer({
    Key? key,
    required this.rideoffer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    initializeDateFormatting('pt_BR', null);

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
              Container(
                height: 3,
                color: buildStatus(),
              ),
              Positioned(
                top: 5,
                left: 2,
                child: Row(
                  children: [
                    Icon(Icons.place_outlined),
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
                top: 30,
                left: 2,
                child: Row(
                  children: [
                    Icon(Icons.place_rounded),
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
                top: 55,
                left: 2,
                child: Row(
                  children: [
                    Icon(Icons.person),
                    Text(rideoffer.owner.firstName)
                  ],
                ),
              ),
              Positioned(
                top: 80,
                left: 2,
                child: Row(
                  children: [
                    Icon(Icons.watch_later_rounded),
                    Text(DateFormat.Hms('pt_BR').format(rideoffer.dates.last))
                  ],
                ),
              ),
              Positioned(
                bottom: 2,
                right: 2,
                child: Container(
                    margin: EdgeInsets.only(
                      left: 90,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward_rounded),
                      onPressed: () => Get.toNamed(Routes.DETAIL_RIDEOFFER,
                          arguments: rideoffer.obs),
                    )),
              ),
            ], //Chi
          ),
        ),
      ],
    );
  }

  MaterialColor buildStatus() {
    switch (rideoffer.status) {
      case 1:
        return Colors.green;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.red;
    }

    return Colors.green;
  }
}
