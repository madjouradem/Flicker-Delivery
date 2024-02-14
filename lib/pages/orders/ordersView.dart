import 'package:delivery_app/core/calsses/HandlingDataView.dart';
import 'package:delivery_app/core/constant/AppColor.dart';
import 'package:delivery_app/pages/1component/BnbAndDrawer/bottomNavigationBar.dart';
import 'package:delivery_app/pages/orders/widgets/OrderCard.dart';
import 'package:delivery_app/pages/orders/ordersController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderView extends GetView<OrderCtr> {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderCtr());
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Orders'),
            bottom: TabBar(
              indicatorColor: AppColor.breaker,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  child: Text(
                    "Active",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "Archive",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            GetBuilder<OrderCtr>(builder: (_) {
              return Container(
                margin: EdgeInsets.all(10.spMin),
                child: HandlingDataView(
                  statusRequest: controller.statusRequestForActive,
                  child: ListView.builder(
                    itemCount: controller.activeOrdersList.length,
                    itemBuilder: (context, index) {
                      return OrderCard(
                          orderModel: controller.activeOrdersList[index]);
                    },
                  ),
                ),
              );
            }),
            GetBuilder<OrderCtr>(builder: (_) {
              return Container(
                margin: EdgeInsets.all(10.spMin),
                child: HandlingDataView(
                  statusRequest: controller.statusRequestForArchive,
                  child: ListView.builder(
                    itemCount: controller.archiveOrdersList.length,
                    itemBuilder: (context, index) {
                      return OrderCard(
                          orderModel: controller.archiveOrdersList[index]);
                    },
                  ),
                ),
              );
            }),
          ]),
          bottomNavigationBar: const BNB(),
        ),
      ),
    );
  }
}
