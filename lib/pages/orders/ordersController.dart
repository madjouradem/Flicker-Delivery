import 'package:delivery_app/core/calsses/StatusRequest.dart';
import 'package:delivery_app/core/calsses/services.dart';
import 'package:delivery_app/core/functions/handlingData.dart';
import 'package:delivery_app/data/models/OrderModel.dart';
import 'package:delivery_app/pages/orders/ordersData.dart';
import 'package:get/get.dart';

abstract class OrderCtrAbs extends GetxController {
  getData();
}

class OrderCtr extends OrderCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest statusRequestForActive = StatusRequest.none;
  StatusRequest statusRequestForArchive = StatusRequest.none;
  OrderData data = OrderData();
  MyServices myServices = Get.find();
  List<OrderModel> activeOrdersList = [];
  List<OrderModel> archiveOrdersList = [];

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await data.getData(myServices.box.read('delivery')['delivery_id']);
    statusRequest = handlingData(response);
    print(statusRequest);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        response['data'].forEach((element) {
          if (element['order_status'] == 'Out for Delivery') {
            activeOrdersList.add(OrderModel.fromJson(element));
          } else {
            archiveOrdersList.add(OrderModel.fromJson(element));
          }
        });
        if (archiveOrdersList.isEmpty) {
          statusRequestForArchive = StatusRequest.failure;
        }

        if (archiveOrdersList.isEmpty) {
          statusRequestForArchive = StatusRequest.failure;
        }
        print(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      print(response);

      update();
    }
  }
}
