import 'package:delivery_app/core/constant/AppColor.dart';
import 'package:delivery_app/core/constant/AppRoute.dart';
import 'package:delivery_app/pages/1component/BnbAndDrawer/bottomNavigationBar.dart';
import 'package:delivery_app/pages/MorePages/MorePagesController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MorePagesView extends GetView<MorePagesCtr> {
  const MorePagesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MorePagesCtr());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 120.spMin,
          leading: GestureDetector(
            onTap: () {
              Get.snackbar('title', 'message');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40.spMin,
                  width: 40.spMin,
                  decoration: BoxDecoration(
                      color: AppColor.breaker,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: AppColor.primary)),
                ),
                Text(
                  controller.myServices.box.read('delivery')['delivery_name'],
                  style: Theme.of(context).textTheme.displayMedium,
                )
              ],
            ),
          ),
          actions: [
            IconButton(
                color: Colors.transparent,
                onPressed: () {
                  Get.toNamed(AppRoute.settings);
                },
                icon: const Icon(Icons.call))
          ],
          // title: const Text('MorePages'),
        ),
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0.0,
        //   flexibleSpace: Stack(
        //     children: [
        //       Column(
        //         children: [
        //           Container(
        //             height: 120.spMin,
        //             decoration: BoxDecoration(
        //               color: AppColor.primary,
        //               borderRadius: BorderRadius.only(
        //                 bottomLeft: Radius.circular(30.spMin),
        //                 bottomRight: Radius.circular(30.spMin),
        //               ),
        //             ),
        //           ),
        //           Container(
        //             height: 80.spMin,
        //             width: double.infinity,
        //             color: AppColor.white,
        //           )
        //         ],
        //       ),
        //       Container(
        //         alignment: Alignment.center,
        //         margin: EdgeInsets.only(top: 50.spMin),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Container(
        //               height: 90.spMin,
        //               width: 90.spMin,
        //               margin: EdgeInsets.only(bottom: 5.spMin),
        //               decoration: BoxDecoration(
        //                   color: AppColor.breaker,
        //                   image: controller.myServices.box
        //                               .read('delivery')['delivery_image'] ==
        //                           ''
        //                       ? const DecorationImage(
        //                           image: AssetImage(AppImage.image))
        //                       : DecorationImage(
        //                           fit: BoxFit.cover,
        //                           image: NetworkImage(
        //                               "${AppLink.upload}personalImages/${controller.myServices.box.read('delivery')['delivery_image']}")),
        //                   borderRadius: BorderRadius.circular(90.spMin)),
        //             ),
        //             Text(
        //               controller.myServices.box
        //                   .read('delivery')['delivery_image'],
        //               style: Theme.of(context)
        //                   .textTheme
        //                   .displayMedium!
        //                   .copyWith(fontWeight: FontWeight.w600),
        //             )
        //           ],
        //         ),
        //       )
        //     ],
        //   ),
        //   toolbarHeight: 201.spMin,
        // ),
        body: Container(
            margin: EdgeInsets.all(10.spMin),
            height: double.infinity,
            width: double.infinity,
            child: ListView(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.morePagesList.length,
                  itemBuilder: (context, index) {
                    return MorePagesBar(
                      name: controller.morePagesList[index].name,
                      widget: controller.morePagesList[index].widget,
                      route: controller.morePagesList[index].route,
                    );
                  },
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: AppColor.black,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.morePagesList2.length,
                  itemBuilder: (context, index) {
                    return MorePagesBar(
                      name: controller.morePagesList2[index].name,
                      widget: controller.morePagesList2[index].widget,
                      route: controller.morePagesList2[index].route,
                    );
                  },
                ),
              ],
            )),
        bottomNavigationBar: const BNB(),
      ),
    );
  }
}

class MorePagesBar extends StatelessWidget {
  const MorePagesBar({
    super.key,
    required this.name,
    required this.widget,
    this.route,
  });
  final Widget widget;
  final String name;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.spMin),
      child: GestureDetector(
        onTap: route == null
            ? () {}
            : () {
                Get.toNamed(route!);
              },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            widget,
          ],
        ),
      ),
    );
  }
}
