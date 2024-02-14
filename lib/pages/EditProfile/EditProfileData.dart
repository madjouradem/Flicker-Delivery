import 'package:delivery_app/core/calsses/Requests.dart';
import 'package:delivery_app/core/constant/AppLinkes.dart';

class EditProfileData extends Crud {
  changeUsername(String deliveryId, deliveryname) async {
    print(AppLink.changeUsername);
    var response = await postRequest(AppLink.changeUsername,
        {'delivery_id': deliveryId, 'delivery_name': deliveryname});
    return response.fold((l) => l, (r) => r);
  }

  changePassword(String deliveryId, password) async {
    var response = await postRequest(AppLink.changePassword,
        {'delivery_id': deliveryId, 'delivery_password': password});
    return response.fold((l) => l, (r) => r);
  }

  changeImage(String deliveryId, imageName) async {
    var response = await postRequest(AppLink.changeImage,
        {'delivery_id': deliveryId, 'delivery_image': imageName});
    return response.fold((l) => l, (r) => r);
  }
}
