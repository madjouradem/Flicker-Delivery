import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/core/calsses/AddressCrt.dart';
import 'package:delivery_app/core/calsses/services.dart';
import 'package:delivery_app/data/models/OrderModel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class TrakingCtrImp extends GetxController {
  // getPolyline(startlat, startlong, endlat, endlong);
}

class TrakingCtr extends TrakingCtrImp {
  late double endLat;
  late double endLng;
  MyServices myServices = Get.find();
  AddressCtr addressCtr = Get.find();
  Set<Polyline> polylineSet = {};
  StreamSubscription<Position>? positionStream;
  OrderModel? orderModel;

  @override
  void onInit() {
    // TODO: implement onInit
    orderModel = Get.arguments['orderModel'];
    getPositionsStream();
    super.onInit();
  }

  //get position stream
  getPositionsStream() async {
    Timer timer = Timer(const Duration(seconds: 2), () {});
    positionStream = Geolocator.getPositionStream().listen((position) {
      print(position.latitude);
      print(position.longitude);
      if (!timer.isActive) {
        timer = Timer(const Duration(seconds: 2), () {});
        print('........................................................');
        print(orderModel!.orderId);
        FirebaseFirestore.instance
            .collection('delivery')
            .doc(orderModel!.orderId)
            .set({
          'lat': position.latitude,
          'lng': position.longitude,
          'delivery_id': myServices.box.read('delivery')['delivery_id']
        });
        addressCtr.positionStream = positionStream;
        addressCtr.update();
      }
    });
    timer.cancel();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    if (positionStream != null) {
      positionStream!.cancel();
    }
    addressCtr.polylineSet = {};
  }

  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete {
    if (positionStream != null) {
      positionStream!.cancel();
    }

    polylineSet.clear();
    return super.onDelete;
  }
}
