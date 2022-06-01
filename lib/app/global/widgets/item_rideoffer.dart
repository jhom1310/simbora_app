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
              Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.yellow[700],
                    ),
                    /* child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text("STATUS"),
                    ), */
                  )),
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
                    Container(
                        width: Get.width * 0.8,
                        child: Text(rideoffer.departure_display))
                  ],
                ),
              ),
              Positioned(
                top: 30,
                left: 2,
                child: Row(
                  children: [
                    Icon(Icons.place_rounded),
                    Container(
                        width: Get.width * 0.8,
                        child: Text(rideoffer.destination_display))
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
