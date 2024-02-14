import 'package:delivery_app/core/calsses/AddressCrt.dart';
import 'package:delivery_app/core/calsses/DefaultAvater/DefaultAvater.dart';
import 'package:delivery_app/core/calsses/TrakingCtr.dart';
import 'package:delivery_app/core/constant/AppColor.dart';
import 'package:delivery_app/pages/Maps/MapsViewController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_decorated_text/flutter_decorated_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsView extends GetView<AddressCtr> {
  const MapsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressCtr());
    // work when the user want to trak
    if (controller.myServices.box.read('isTrak') != null) {
      if (controller.myServices.box.read('isTrak') == '1') {
        Get.put(TrakingCtr());
      }
    }
    MapsViewCtr mapsViewCtr = Get.put(MapsViewCtr());
    return SafeArea(
      child: Scaffold(
          // extendBodyBehindAppBar: true,
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   leading:
          // ),

          body: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) => SizedBox(
              height: constraints.maxHeight,
              child: GetBuilder<AddressCtr>(builder: (_) {
                return controller.kGooglePlex != null
                    ? GoogleMap(
                        mapType: MapType.normal,
                        polylines: controller.polylineSet,
                        myLocationEnabled: true,
                        markers: controller.markers.toSet(),
                        onTap: (latlng) {
                          controller.addMarker(latlng);
                        },
                        initialCameraPosition: controller.kGooglePlex!,
                        onMapCreated:
                            (GoogleMapController googleMapController) {
                          // controller.completer.complete(googleMapController);
                          controller.gmc = googleMapController;
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                        color: AppColor.primary,
                      ));
              }),
            ),
          ),
          Positioned(
            top: 10.spMin,
            left: 5.spMin,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                // margin: EdgeInsets.all(5.spMin),
                child: CircleAvatar(
                  backgroundColor: AppColor.primary,
                  child: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.5,
            minChildSize: 0.03,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 8.spMin),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(0, 3),
                          blurRadius: 10)
                    ],
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r))),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 135.spMin, vertical: 5.spMin),
                      child: const Divider(
                        thickness: 5,
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(bottom: 10.spMin),
                      child: Row(
                        children: [
                          Expanded(
                            child: DecoratedText(
                                text:
                                    'Order Number : N° ${mapsViewCtr.orderModel.orderId} ',
                                rules: [
                                  DecoratorRule.words(
                                      words: ['Order', 'Number'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold))
                                ]),
                          ),
                          Expanded(
                            child: DecoratedText(
                                text:
                                    'Cost of  delivery : ${mapsViewCtr.orderModel.orderPriceDelivery} \$ ',
                                rules: [
                                  DecoratorRule.words(
                                      words: ['Cost', 'of', 'delivery'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold))
                                ]),
                          ),
                        ],
                      ),
                    ),
                    GetBuilder<AddressCtr>(builder: (_) {
                      return Container(
                        margin: EdgeInsetsDirectional.only(bottom: 10.spMin),
                        child: Row(
                          children: [
                            Expanded(
                              child: DecoratedText(
                                  text: 'To :  ${controller.endAddress}',
                                  rules: [
                                    DecoratorRule.word(
                                        word: 'To',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            Expanded(
                              child: DecoratedText(
                                  text: 'Distence : ${controller.distence}',
                                  rules: [
                                    DecoratorRule.word(
                                        word: 'Distence',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.bold))
                                  ]),
                            ),
                          ],
                        ),
                      );
                    }),
                    Container(
                      height: 60.spMin,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.primary,
                            width: 2.spMin,
                          ),
                          borderRadius: BorderRadius.circular(10.r)),
                      margin: EdgeInsets.symmetric(
                        horizontal: 40.spMin,
                        vertical: 10.spMin,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 10.spMin),
                          DefaultAvater(
                            name: mapsViewCtr.orderModel.userName!,
                            image: mapsViewCtr.orderModel.userImage,
                          ),
                          SizedBox(width: 15.spMin),
                          Expanded(
                              child: Text(
                            mapsViewCtr.orderModel.userName!,
                            style: Theme.of(context).textTheme.displayMedium,
                          )),
                          const Icon(Icons.email),
                          SizedBox(width: 15.spMin),
                          const Icon(Icons.phone),
                          SizedBox(width: 10.spMin),
                        ],
                      ),
                    ),
                    GetBuilder<AddressCtr>(builder: (_) {
                      return controller.myServices.box.read('isTrak') == '1'
                          ? GestureDetector(
                              onTap: () {
                                //  change order status
                                // stop stream position
                                mapsViewCtr.deliveredOrder();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 60.spMin,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 40.spMin,
                                  vertical: 10.spMin,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.circular(10.spMin),
                                ),
                                child: Text(
                                  'Delivered',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                mapsViewCtr.confirmationOrders();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 60.spMin,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 40.spMin,
                                  vertical: 10.spMin,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.circular(10.spMin),
                                ),
                                child: Text(
                                  'Start Delivering',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            );
                    }),
                  ],
                ),
              );
            },
          )
        ],
      )),
    );
  }
}
