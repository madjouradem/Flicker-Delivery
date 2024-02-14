import 'package:delivery_app/core/calsses/StatusRequest.dart';
import 'package:delivery_app/core/calsses/services.dart';
import 'package:delivery_app/core/constant/AppRoute.dart';
import 'package:delivery_app/data/models/MorePagesModel.dart';
import 'package:delivery_app/pages/MorePages/MorePagesData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MorePagesCtrAbs extends GetxController {}

class MorePagesCtr extends MorePagesCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  MorePagesData data = MorePagesData();
  MyServices myServices = Get.find();

  List<MorePagesModel> morePagesList = [
    MorePagesModel(
      name: 'Edit Profile',
      route: AppRoute.editprofile,
      widget: GestureDetector(child: const Icon(Icons.call)),
    ),
    // MorePagesModel(
    //   name: 'Notification',
    //   route: AppRoute.orders,
    // //   widget: GestureDetector(child: SvgPicture.asset(AppImage.)),
    // ),
    MorePagesModel(
      name: 'Language',
      route: AppRoute.orders,
      widget: GestureDetector(child: const Icon(Icons.call)),
    ),
    MorePagesModel(
      name: 'Orders',
      route: AppRoute.orders,
      widget: GestureDetector(child: const Icon(Icons.call)),
    ),
    MorePagesModel(
      name: 'Dark Mode',
      route: AppRoute.orders,
      widget: Switch(
        value: false,
        onChanged: (value) {},
      ),
    )
  ];

  List<MorePagesModel> morePagesList2 = [
    MorePagesModel(
        name: 'Privicy Policey',
        route: AppRoute.home,
        widget: GestureDetector(child: const Icon(Icons.privacy_tip_outlined))),
    MorePagesModel(
        name: 'Contact Us',
        route: AppRoute.home,
        widget: GestureDetector(child: const Icon(Icons.call))),
  ];
}
