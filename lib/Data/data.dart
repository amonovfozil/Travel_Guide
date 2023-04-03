import 'package:flutter/cupertino.dart';
import 'package:travel_guide/Data/models/Model_Places.dart';

class DataPlaces {
 static Placelocation location1 =
      Placelocation(adress: 'adress', Latitude: 123.2, Longitude: 152.636);
  static List<place> listPlace = [
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
        locations: location1,
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
      locations: location1,
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
      locations: location1,
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
      locations: location1,
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
      locations: location1,
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
      locations: location1,
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
      locations: location1,
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
      locations: location1,
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
      locations: location1,
    ),
  ];
}
