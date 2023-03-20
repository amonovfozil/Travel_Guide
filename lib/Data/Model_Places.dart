import 'package:flutter/cupertino.dart';

enum category { nature, historical }

class Placelocation {
  final String Latitude; // Y-o`qi
  final String Longitude; // X-o`qi
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

class Placess with ChangeNotifier {
  List<place> _places = [
    place(
      id: UniqueKey().toString(),
      title: 'Ark Qo`rg`oni',
      regionId: '3',
      ImagesUrl: [
        'assets/images/Regions/ark1.jpg',
        'assets/images/Regions/ark2.jpg',
        'assets/images/Regions/ark3.jpg'
      ],
      descriptions:
          'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy,juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boyjuda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
      deteils: 'tarixiy obidalar va ko`rgazmalarga boy',
      TypeCategory: category.historical,
      locations: 'locations',
    ),
    place(
      id: UniqueKey().toString(),
      title: 'Minorai Kalon',
      regionId: '3',
      ImagesUrl: [
        'assets/images/Regions/minor1.jpg',
        'assets/images/Regions/minor2.jpg',
        'assets/images/Regions/minor3.jpg'
      ],
      descriptions: 'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
      deteils: 'tarixiy obidalar va ko`rgazmalarga boy',
      TypeCategory: category.historical,
      locations: 'locations',
    ),
    place(
      id: UniqueKey().toString(),
      title: 'Ismoil Samoniy Maqbarasi',
      regionId: '3',
      ImagesUrl: [
        'assets/images/Regions/sa1.jpg',
        'assets/images/Regions/sa2.jpg',
        'assets/images/Regions/sa3.jpg'
      ],
      descriptions: 'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
      deteils: 'tarixiy obidalar va ko`rgazmalarga boy',
      TypeCategory: category.historical,
      locations: 'locations',
    ),
    place(
      id: UniqueKey().toString(),
      title: 'Registon',
      regionId: '8',
      ImagesUrl: [
        'assets/images/Regions/sam/re1.jpg',
        'assets/images/Regions/sam/re2.jpg',
        'assets/images/Regions/sam/re3.jpg',
      ],
      descriptions:
          'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy,juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boyjuda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
      deteils: 'tarixiy obidalar va ko`rgazmalarga boy',
      TypeCategory: category.historical,
      locations: 'locations',
    ),
    place(
      id: UniqueKey().toString(),
      title: 'Go`ri Amir',
      regionId: '8',
      ImagesUrl: [
        'assets/images/Regions/sam/go`.jpg',
        'assets/images/Regions/sam/go2.jpg',
        'assets/images/Regions/sam/go3.jpg',
      ],
      descriptions: 'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
      deteils: 'tarixiy obidalar va ko`rgazmalarga boy',
      TypeCategory: category.historical,
      locations: 'locations',
    ),
    place(
      id: UniqueKey().toString(),
      title: 'Bibixonim',
      regionId: '8',
      ImagesUrl: [
        'assets/images/Regions/sam/bi1.jpg',
        'assets/images/Regions/sam/bi2.jpg',
        'assets/images/Regions/sam/bi3.jpg',
      ],
      descriptions: 'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
      deteils: 'tarixiy obidalar va ko`rgazmalarga boy',
      TypeCategory: category.historical,
      locations: 'locations',
    ),
    place(
      id: UniqueKey().toString(),
      title: 'Ko‘kaldosh madrasasi',
      regionId: '1',
      ImagesUrl: [
        'assets/images/Regions/tosh/kok1.jpg',
        'assets/images/Regions/tosh/ko`k2.jpg',
        'assets/images/Regions/tosh/ko`k3.jpg',
      ],
      descriptions:
          'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy,juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boyjuda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
      deteils: 'tarixiy obidalar va ko`rgazmalarga boy',
      TypeCategory: category.historical,
      locations: 'locations',
    ),
    place(
      id: UniqueKey().toString(),
      title: 'Baroqxon madrasasi',
      regionId: '1',
      ImagesUrl: [
        'assets/images/Regions/tosh/ba1.jpg',
        'assets/images/Regions/tosh/ba2.jpg',
        'assets/images/Regions/tosh/ba3.jpg',
      ],
      descriptions: 'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
      deteils: 'tarixiy obidalar va ko`rgazmalarga boy',
      TypeCategory: category.historical,
      locations: 'locations',
    ),
    place(
      id: UniqueKey().toString(),
      title: 'Hazrati Imom',
      regionId: '1',
      ImagesUrl: [
        'assets/images/Regions/tosh/ha1.jpg',
        'assets/images/Regions/tosh/ha2.png',
        'assets/images/Regions/tosh/ha3.jpg',
      ],
      descriptions: 'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
      deteils: 'tarixiy obidalar va ko`rgazmalarga boy',
      TypeCategory: category.historical,
      locations: 'locations',
    ),
  ];
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
