// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GeolocatorRepo {
  late bool serviceEnabled;
  late LocationPermission permission;
  static String apiKey = "xxxxxxxxxxxxxxxxx";
  static String geoCodingUrl =
      "http://api.positionstack.com/v1/reverse?access_key=$apiKey&query=";

  Future<Position> getCurrentLocation() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Location services are disabled.');
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
        return Future.error('Location permissions are denied');
      }

      if (permission == LocationPermission.deniedForever) {
        Fluttertoast.showToast(
            msg:
                'Location permissions are permanently denied, we cannot request permissions.');
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
  }

  Future<String> reverseGeoCoding(Position cordinates) async {
    var address;
    try {
      final address = await http.get(Uri.parse(geoCodingUrl +
          cordinates.latitude.toString() +
          "," +
          cordinates.longitude.toString()));
      var json = convert.jsonDecode(address.body);
      var res = (json['data'][0]['label']);
      return res;

    } catch (e) {
      return address;
    }
  }
}
