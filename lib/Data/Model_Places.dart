import 'package:flutter/cupertino.dart';

enum category { nature, historical }

class place {
  final String id;
  final String title;
  final String regionId;
  final List<String> ImagesUrl;
  final String descriptions;
  final String deteils;
  final category TypeCategory;
  final String locations;
  bool islike;

  place({
    required this.id,
    required this.title,
    required this.regionId,
    required this.ImagesUrl,
    required this.descriptions,
    required this.deteils,
    required this.TypeCategory,
    required this.locations,
    this.islike = false,
  });
}
 