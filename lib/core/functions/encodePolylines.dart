// import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Set<Polyline> polylineSet = {};
// List<LatLng> polylineco = [];
// PolylinePoints polylinePoints = PolylinePoints();
Future<void> getPolyline(startlat, startlong, endlat, endlong) async {
  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$startlat,$startlong&destination=$endlat,$endlong&key=AIzaSyBhMSYZNcRfKAoY6Bkp283hpCiRg8pbLB8";
  var response = await http.post(Uri.parse(url));
  var responseBody = jsonDecode(response.body);
  var point = responseBody['routes'][0]['overview_polyline']['points'];
  print(point);
}
