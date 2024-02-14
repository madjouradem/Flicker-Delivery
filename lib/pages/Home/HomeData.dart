import 'package:delivery_app/core/calsses/Requests.dart';
import 'package:delivery_app/core/constant/AppLinkes.dart';

class HomeData extends Crud {
  getData(String deliveryId) async {
    var response =
        await postRequest(AppLink.viewOrders, {'delivery_id': deliveryId});
    return response.fold((l) => l, (r) => r);
  }
}
