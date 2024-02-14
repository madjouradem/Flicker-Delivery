import 'package:delivery_app/core/calsses/HandlingDataView.dart';
import 'package:delivery_app/pages/1component/BnbAndDrawer/bottomNavigationBar.dart';
import 'package:delivery_app/pages/Home/HomeController.dart';
import 'package:delivery_app/pages/Home/widgets/OrderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeCtr> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeCtr());

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(''),
        body: Container(
          margin: EdgeInsets.all(10.spMin),
          child: GetBuilder<HomeCtr>(builder: (_) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              child: ListView.builder(
                itemCount: controller.ordersList.length,
                itemBuilder: (context, index) {
                  return OrderCard(
                    orderModel: controller.ordersList[index],
                    distance: 100,
                  );
                },
              ),
            );
          }),
        ),
        bottomNavigationBar: const BNB(),
      ),
    );
  }
}
