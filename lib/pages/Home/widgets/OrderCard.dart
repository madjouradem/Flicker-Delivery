import 'package:delivery_app/core/constant/AppColor.dart';
import 'package:delivery_app/core/constant/AppRoute.dart';
import 'package:delivery_app/data/models/OrderModel.dart';
import 'package:delivery_app/pages/Home/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_decorated_text/flutter_decorated_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrderCard extends GetView<HomeCtr> {
  const OrderCard(
      {super.key, required this.orderModel, required this.distance});

  final OrderModel orderModel;
  final double distance;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.spMin),
      margin: EdgeInsets.symmetric(vertical: 10.spMin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.spMin),
        color: AppColor.lightbackgroundC,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 3),
            color: Color.fromARGB(82, 0, 0, 0),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    Text(
                      'Order Number : ',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            // color: AppColor.primary,
                          ),
                    ),
                    Text(
                      'N°${orderModel.orderId}',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColor.primary,
                          ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  Jiffy.parse(orderModel.orderDate!).toNow(),
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.breaker,
                      ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Order Status : ',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              Text(
                orderModel.orderStatus!,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: orderModel.orderStatus == 'Delivered'
                          ? AppColor.primary
                          : AppColor.breaker,
                    ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          DecoratedText(
            text:
                'Order Address :  ${orderModel.addressCity} ${orderModel.addressStrees}  ',
            rules: [
              DecoratorRule.between(
                start: '  ',
                end: '  ',

                // words: [orderModel.addressCity!, orderModel.addressStrees!],
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              )
            ],
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          DecoratedText(
            text: 'Payment Methode :  ${orderModel.orderPayType}  ',
            rules: [
              DecoratorRule.between(
                start: '  ',
                end: '  ',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              )
            ],
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          // DecoratedText(
          //   text: 'Distance :  $distance Km  ',
          //   rules: [
          //     DecoratorRule.between(
          //       start: '  ',
          //       end: '  ',
          //       style: Theme.of(context).textTheme.displayMedium!.copyWith(
          //             fontWeight: FontWeight.w500,
          //           ),
          //     )
          //   ],
          //   style: Theme.of(context).textTheme.displayMedium!.copyWith(
          //         fontWeight: FontWeight.bold,
          //       ),
          // ),
          orderModel.orderStatus != 'Out for Delivery'
              ? Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      controller.myServices.box
                          .write('lat', double.parse(orderModel.addressLat!));
                      controller.myServices.box
                          .write('lng', double.parse(orderModel.addressLng!));
                      controller.myServices.box.write('isTrak', null);
                      Get.toNamed(AppRoute.maps,
                          arguments: {'orderModel': orderModel});
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.spMin),
                      // margin: EdgeInsets.all(10.spMin),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.spMin),
                          color: AppColor.primary),
                      child: Text(
                        'More Details',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ),
                )
              : Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      //save the lat and long for the order owner
                      controller.myServices.box
                          .write('lat', double.parse(orderModel.addressLat!));
                      controller.myServices.box
                          .write('lng', double.parse(orderModel.addressLng!));
                      // it's helping for mange TrackCtr
                      controller.myServices.box.write('isTrak', '1');

                      Get.toNamed(AppRoute.maps,
                          arguments: {'orderModel': orderModel});
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.spMin),
                      // margin: EdgeInsets.all(10.spMin),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.spMin),
                          color: AppColor.primary),
                      child: Text(
                        'Trak',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
