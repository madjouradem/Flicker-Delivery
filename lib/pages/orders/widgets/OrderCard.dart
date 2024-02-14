import 'package:delivery_app/core/constant/AppColor.dart';
import 'package:delivery_app/core/constant/AppRoute.dart';
import 'package:delivery_app/data/models/OrderModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.orderModel});

  final OrderModel orderModel;

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
            color: Color.fromARGB(175, 0, 0, 0),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      fontWeight: FontWeight.bold,
                      color: orderModel.orderStatus == 'Delivered'
                          ? AppColor.primary
                          : AppColor.breaker,
                    ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Text(
            'Order Address : ${orderModel.addressCity} ${orderModel.addressStrees}',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            'Paynemt Methode : ${orderModel.orderPayType}',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.orderLocation);
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
          ),
        ],
      ),
    );
  }
}
