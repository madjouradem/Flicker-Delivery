import 'package:delivery_app/core/calsses/AddressCrt.dart';
import 'package:delivery_app/core/calsses/StatusRequest.dart';
import 'package:delivery_app/core/calsses/services.dart';
import 'package:delivery_app/core/functions/alertWaiting.dart';
import 'package:delivery_app/core/functions/handlingData.dart';
import 'package:delivery_app/data/models/OrderModel.dart';
import 'package:delivery_app/pages/Home/HomeController.dart';
import 'package:delivery_app/pages/Maps/MapsViewData.dart';
import 'package:get/get.dart';

abstract class MapsViewCtrAbs extends GetxController {
  confirmationOrders();
  deliveredOrder();
}

class MapsViewCtr extends MapsViewCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  MapsViewData data = MapsViewData();
  MyServices myServices = Get.find();
  late OrderModel orderModel;
  AddressCtr addressCtr = Get.find<AddressCtr>();

  @override
  void onInit() {
    orderModel = Get.arguments['orderModel'];
    super.onInit();
  }

  @override
  confirmationOrders() async {
    alertWaiting();

    var response = await data.confirmationOrders(
        orderModel.orderId!,
        orderModel.orderUserId!,
        myServices.box.read('delivery')['delivery_id']);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // Get.back();
        Get.back();
        Get.back();
        Get.find<HomeCtr>().refreshData();

        // 2.delay();
        // Get.back();
        // Get.toNamed(AppRoute.maps, arguments: {'orderModel': orderModel});
      } else {
        statusRequest = StatusRequest.failure;
      }
      print(response);

      update();
    }
  }

  @override
  deliveredOrder() async {
    alertWaiting();
    print(myServices.box.read('delivery')['delivery_id']);
    var response =
        await data.deliveredOrder(orderModel.orderId!, orderModel.orderUserId!);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (addressCtr.positionStream != null) {
          addressCtr.positionStream!.cancel();
        }
        Get.back();
        Get.back();
        Get.find<HomeCtr>().refreshData();
      } else {
        statusRequest = StatusRequest.failure;
      }
      print(response);

      update();
    }
  }

  @override
  void dispose() {
    if (addressCtr.webViewController != null) {
      addressCtr.webViewController!.clearCache();
      print('/from dispose');
    }

    super.dispose();
  }

  @override
  void onClose() {
    if (addressCtr.webViewController != null) {
      // addressCtr.webViewController!.clearCache();
      // addressCtr.webViewController!.clearLocalStorage();
      addressCtr.webViewController = null;
      print('/from onclose');
    }
    print('/from onclosess');

    super.onClose();
  }
}
