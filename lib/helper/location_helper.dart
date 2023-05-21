// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../constant/google_maps.dart';

class locationHelper {
  static String getLocationImg(
      {required double latitud, required double longtitud}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitud,$longtitud&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:S%7C$latitud,$longtitud&key=$GOOGLE_API_Key';
  }

  static Future<String> getSelectlocationAdrees(LatLng location) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${location.latitude},${location.longitude}&key=$GOOGLE_API_Key');
    final response = await http.get(url);
    final data = jsonDecode(response.body);

    return data['results'][0]['formatted_address'];
  }
}
