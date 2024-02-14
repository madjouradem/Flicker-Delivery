import 'package:delivery_app/core/calsses/Requests.dart';
import 'package:delivery_app/core/constant/AppLinkes.dart';

class MapsViewData extends Crud {
  confirmationOrders(String orderId, orderUserId, deliveryId) async {
    var response = await postRequest(AppLink.confirmationOrders, {
      'order_user_id': orderUserId,
      'order_id': orderId,
      'delivery_id': deliveryId
    });
    return response.fold((l) => l, (r) => r);
  }

  deliveredOrder(String orderId, orderUserId) async {
    var response = await postRequest(AppLink.deliveredOrders,
        {'order_user_id': orderUserId, 'order_id': orderId});
    return response.fold((l) => l, (r) => r);
  }
}
