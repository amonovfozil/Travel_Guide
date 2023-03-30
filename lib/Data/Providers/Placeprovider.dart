import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:travel_guide/Data/Model_Places.dart';
import 'package:travel_guide/dataBase/Places_db.dart';

class Placesproviders with ChangeNotifier {
  List<place> _Places = [
    place(
        id: UniqueKey().toString(),
        title: 'Ark Qo`rg`oni',
        regionId: '3',
        Image: [
          'assets/images/Regions/ark1.jpg',
          'assets/images/Regions/ark2.jpg',
          'assets/images/Regions/ark3.jpg'
        ],
        descriptions:
            'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy,juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boyjuda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
        TypeCategory: category.historical,
        locations: 'locations',
        islike: true),
    place(
      id: UniqueKey().toString(),
      title: 'Minorai Kalon',
      regionId: '3',
      Image: [
        'assets/images/Regions/minor1.jpg',
        'assets/images/Regions/minor2.jpg',
        'assets/images/Regions/minor3.jpg'
      ],
      descriptions: 'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
      TypeCategory: category.historical,
      locations: 'locations',
    ),
    place(
      id: UniqueKey().toString(),
      title: 'Ismoil Samoniy Maqbarasi',
      regionId: '3',
      Image: [
        'assets/images/Regions/sa1.jpg',
        'assets/images/Regions/sa2.jpg',
        'assets/images/Regions/sa3.jpg'
      ],
      descriptions: 'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
      TypeCategory: category.historical,
      locations: 'locations',
    ),
    place(
      id: UniqueKey().toString(),
      title: 'Registon',
      regionId: '8',
      Image: [
        'assets/images/Regions/sam/re1.jpg',
        'assets/images/Regions/sam/re2.jpg',
        'assets/images/Regions/sam/re3.jpg',
      ],
      descriptions:
          'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy,juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boyjuda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
      TypeCategory: category.historical,
      locations: 'locations',
    ),
    place(
      id: UniqueKey().toString(),
      title: 'Go`ri Amir',
      regionId: '8',
      Image: [
        'assets/images/Regions/sam/go`.jpg',
        'assets/images/Regions/sam/go2.jpg',
        'assets/images/Regions/sam/go3.jpg',
      ],
      descriptions: 'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
      TypeCategory: category.historical,
      locations: 'locations',
    ),
    place(
      id: UniqueKey().toString(),
      title: 'Bibixonim',
      regionId: '8',
      Image: [
        'assets/images/Regions/sam/bi1.jpg',
        'assets/images/Regions/sam/bi2.jpg',
        'assets/images/Regions/sam/bi3.jpg',
      ],
      descriptions: 'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
      TypeCategory: category.historical,
      locations: 'locations',
    ),
    place(
      id: UniqueKey().toString(),
      title: 'Ko‘kaldosh madrasasi',
      regionId: '1',
      Image: [
        'assets/images/Regions/tosh/kok1.jpg',
        'assets/images/Regions/tosh/ko`k2.jpg',
        'assets/images/Regions/tosh/ko`k3.jpg',
      ],
      descriptions:
          'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy,juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boyjuda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
      TypeCategory: category.historical,
      locations: 'locations',
    ),
    place(
      id: UniqueKey().toString(),
      title: 'Baroqxon madrasasi',
      regionId: '1',
      Image: [
        'assets/images/Regions/tosh/ba1.jpg',
        'assets/images/Regions/tosh/ba2.jpg',
        'assets/images/Regions/tosh/ba3.jpg',
      ],
      descriptions: 'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
      TypeCategory: category.historical,
      locations: 'locations',
    ),
    place(
      id: UniqueKey().toString(),
      title: 'Hazrati Imom',
      regionId: '1',
      Image: [
        'assets/images/Regions/tosh/ha1.jpg',
        'assets/images/Regions/tosh/ha2.png',
        'assets/images/Regions/tosh/ha3.jpg',
      ],
      descriptions: 'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
      TypeCategory: category.historical,
      locations: 'locations',
    ),
  ];

  List<place> get PlacesList {
    return _Places;
  }

  List<place> placeFilterByRegion(var index, [category? type]) {
    return _Places.where((element) => type == null
        ? element.regionId == index.toString()
        : element.regionId == index.toString() &&
            element.TypeCategory == type).toList();
  }

  List<place> favorityPlaces() {
    return _Places.where((element) => element.islike).toList();
  }

  void ToggleFavority(String id) {
    final SelectPlaces = _Places.firstWhere((element) => element.id == id);
    SelectPlaces.islike = !SelectPlaces.islike;
    notifyListeners();
  }

  void getNewPlaces(String title, String desc, category type, String regionId,
      List<dynamic> image) {
    place newPlaces = place(
        id: UniqueKey().toString(),
        title: title,
        regionId: regionId,
        Image: image,
        descriptions: desc,
        TypeCategory: type,
        locations: 'locations');
    _Places.add(newPlaces);
    notifyListeners();
  }
}
