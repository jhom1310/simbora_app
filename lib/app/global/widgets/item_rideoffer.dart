import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/ride_offer_model.dart';
import 'package:simbora_app/app/routes/app_pages.dart';

class ItemRideOffer extends StatelessWidget {
  final RideOffer rideoffer;
  const ItemRideOffer({
    Key? key,
    required this.rideoffer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                left: 260,
                child: Container(
                  height: 30,
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          rideoffer.owner.toString(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 159,
                top: 30,
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
                                    'PEGAR',
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
