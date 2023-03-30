import 'dart:io';

import 'package:flutter/cupertino.dart';

enum category { nature, historical }

class Placelocation {
  final double Latitude; // Y-o`qi
  final double Longitude; // X-o`qi
  final String adress;
  Placelocation({
    required this.adress,
    required this.Latitude,
    required this.Longitude,
  });
}

class place {
  final String id;
  final String title;
  final String regionId;
  final List<dynamic> Image;
  final String descriptions;
  final category TypeCategory;
  final String locations;
  bool islike;

  place({
    required this.id,
    required this.title,
    required this.regionId,
    required this.Image,
    required this.descriptions,
    required this.TypeCategory,
    required this.locations,
    this.islike = false,
  });
}

class Placess with ChangeNotifier {
  List<place> _places = [];
  List<place> get list {
    return _places;
  }

  List<place> placeFilterByRegion(var index, [category? type]) {
    return _places
        .where((element) => type == null
            ? element.regionId == index.toString()
            : element.regionId == index.toString() &&
                element.TypeCategory == type)
        .toList();
  }

  List<place> favorityPlaces() {
    return _places.where((element) => element.islike).toList();
  }

  void ToggleFavority(String id) {
    final SelectPlaces = _places.firstWhere((element) => element.id == id);
    SelectPlaces.islike = !SelectPlaces.islike;
  }
}
