import 'package:flutter/cupertino.dart';
import 'package:travel_guide/Data/Model_Places.dart';

class Placesproviders with ChangeNotifier {
  List<place> _Places = [];

  List<place> get PlacesList {
    return _Places;
  }
}
