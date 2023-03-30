import 'package:travel_guide/constant/google_maps.dart';

class locationHelper {
  static String getLocationImg(
      {required double latitud, required double longtitud}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitud,$longtitud&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:S%7C$latitud,$longtitud&key=$GOOGLE_Key';
  }
}
