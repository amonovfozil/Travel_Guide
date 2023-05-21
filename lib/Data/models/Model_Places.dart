// ignore: camel_case_types
// ignore_for_file: file_names, camel_case_types, duplicate_ignore, non_constant_identifier_names

enum category { nature, historical }

class Placelocation {
  final double Latitude; // Y-o`qi
  final double Longitude; // X-o`qi
  final String adress;
  Placelocation({
    required this.Latitude,
    required this.Longitude,
    required this.adress,
  });
}

class place {
  final String id;
  final String title;
  final String regionId;
  final List<String> Image;
  final String descriptions;
  final category TypeCategory;
  final Placelocation locations;
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
