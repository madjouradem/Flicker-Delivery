import 'package:delivery_app/core/functions/reciveNotification.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';

class MyServices extends GetxService {
  late GetStorage box;
  Future<MyServices> init() async {
    await Firebase.initializeApp();
    await GetStorage.init();
    box = GetStorage();
    await requestPermission();
    reciveNotification();
    // encodePolylines();
    // Get.put(AddressCtr());
    // Get.put(LanguageCtr());

    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
