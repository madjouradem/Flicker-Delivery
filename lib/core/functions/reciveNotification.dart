import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestPermission() async {
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

reciveNotification() {
  FirebaseMessaging.onMessage.listen((event) {
    FlutterRingtonePlayer.playNotification();

    if (event.data['pagename'] == Get.currentRoute) {}
  });
}
