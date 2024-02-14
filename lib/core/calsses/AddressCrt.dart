import 'dart:convert';

import 'package:delivery_app/core/constant/AppColor.dart';
import 'package:delivery_app/data/models/OrderModel.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:async';

import 'package:delivery_app/core/calsses/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

abstract class AddressCtrImp extends GetxController {
  determinePosition();
  getPosition();
  addMarker(LatLng latlng);
  getPolylineandInfo(startlat, startlong, endlat, endlong);
}

class AddressCtr extends AddressCtrImp {
  MyServices myServices = Get.find();
  List<Placemark> placemarks = [];
  Position? pos;
  double lat = 0.0;
  double lng = 0.0;
  late double endLat;
  late double endLng;
  StreamSubscription<Position>? positionStream;
  String? city;
  String? street;
  Set<Polyline> polylineSet = {};
  WebViewController? webViewController;
  final Completer<GoogleMapController> completer =
      Completer<GoogleMapController>();
  CameraPosition? kGooglePlex;
  GoogleMapController? gmc;
  OrderModel? orderModel;
  List<Marker> markers = [];
  List<LatLng> polylineco = [];
  String distence = '0.0 km';
  String endAddress = 'unkown';

//==========================================================================

  @override
  void onInit() {
    orderModel = Get.arguments['orderModel'];
    endLat = double.parse(orderModel!.addressLat!);
    endLng = double.parse(orderModel!.addressLng!);

    getPosition();
    super.onInit();
  }

  @override
  addMarker(LatLng latlng) async {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId('1'), position: latlng));
    placemarks =
        await placemarkFromCoordinates(latlng.latitude, latlng.longitude);
    if (placemarks.isNotEmpty) {
      city = '${placemarks[0].administrativeArea}'
          ' ${placemarks[0].subAdministrativeArea}';
      street = placemarks[0].street;
      lat = pos!.latitude;
      lng = pos!.longitude;
    }
    await getPosition();
    update();
  }

  @override
  getPosition() async {
    pos = await determinePosition();
    placemarks = await placemarkFromCoordinates(pos!.latitude, pos!.longitude);
    lat = pos!.latitude;
    lng = pos!.longitude;
    city = placemarks[0].administrativeArea;
    street = placemarks[0].street;
    kGooglePlex = CameraPosition(
      target: LatLng(pos!.latitude, pos!.longitude),
      zoom: 14.4746,
    );
    markers.clear();
    markers.add(Marker(
        markerId: const MarkerId('0'), position: LatLng(endLat, endLng)));
    await getPolylineandInfo(lat, lng, endLat, endLng);
    update();
  }

  @override
  Future<void> getPolylineandInfo(startlat, startlong, endlat, endlong) async {
    PolylinePoints polylinePoints = PolylinePoints();

    //request to get json info for directions [get polyline string and distence and endAddress]

    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=$startlat,$startlong&destination=$endlat,$endlong&key=AIzaSyBhMSYZNcRfKAoY6Bkp283hpCiRg8pbLB8";
    var response = await http.post(Uri.parse(url));
    var responseBody = jsonDecode(response.body);
    var point = responseBody['routes'][0]['overview_polyline']['points'];
    distence = responseBody['routes'][0]['legs'][0]['distance']['text'];
    endAddress = responseBody['routes'][0]['legs'][0]['end_address'];
    //convert polyline point to lat lng point
    List<PointLatLng> result = polylinePoints.decodePolyline(point);
    if (result.isNotEmpty) {
      for (var pointLatLng in result) {
        polylineco.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      }
    }
    // paint the polyline
    Polyline polyline = Polyline(
        polylineId: const PolylineId("1"),
        color: AppColor.primary,
        width: 5,
        points: polylineco);
    polylineSet.add(polyline);

    update();
  }

  @override
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      loc.Location location = loc.Location();
      bool isturnedon = await location.requestService();
      if (isturnedon) {
        print("GPS device is turned ON");
      } else {
        print("GPS Device is still OFF");
        Get.back();
      }

      // return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // hen we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  ///get Distance Between current location and anthor location

  getDistanceBetween(
      {required double starLat,
      required double starLng,
      required double endLat,
      required double endLng}) {
    double distanceInMeters = Geolocator.distanceBetween(
        pos!.latitude, pos!.longitude, endLat, endLng);
    double distanceInKiloMeters = distanceInMeters / 1000;
    double roundDistanceInKM =
        double.parse((distanceInKiloMeters).toStringAsFixed(3));
    return roundDistanceInKM;
  }

  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete {
    polylineSet.clear();
    return super.onDelete;
  }
}
