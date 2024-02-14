import 'package:delivery_app/core/calsses/StatusRequest.dart';
import 'package:delivery_app/core/calsses/services.dart';
import 'package:delivery_app/core/functions/handlingData.dart';
import 'package:delivery_app/data/models/OrderModel.dart';
import 'package:delivery_app/pages/Home/HomeData.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

abstract class HomeCtrAbs extends GetxController {
  getData();
  refreshData();
}

class HomeCtr extends HomeCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  HomeData data = HomeData();
  MyServices myServices = Get.find();
  List<OrderModel> ordersList = [];
  Position? pos;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    print(myServices.box.read('delivery')['delivery_id']);
    var response =
        await data.getData(myServices.box.read('delivery')['delivery_id']);
    statusRequest = handlingData(response);
    print(statusRequest);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        response['data'].forEach((element) {
          ordersList.add(OrderModel.fromJson(element));
        });
        print(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      print(response);

      update();
    }
  }

  // getposition() async {
  //   // AddressCtr addressCtr = Get.put(AddressCtr());
  //   // pos = await addressCtr.determinePosition();

  //   update();
  // }

  @override
  refreshData() {
    ordersList.clear();
    getData();
  }
}
