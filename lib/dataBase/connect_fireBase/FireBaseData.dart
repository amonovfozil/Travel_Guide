// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel_guide/Data/models/Model_Places.dart';

class FireBaseData {
  // dasturnni backend qismiga ya`ni FireBase ga ulovchi Url....

  static Uri url = Uri.parse(
      'https://travelguide-d0410-default-rtdb.firebaseio.com/Places.json');

// ma`lumotlarni FireBase (RialTime data baza)ga yuborish.....

  static Future<String> SendDataToFireBase(place NewPlace) async {
    try {
      final response = await http.post(
        url,
        body: jsonEncode(
          {
            'title': NewPlace.title,
            'desc': NewPlace.descriptions,
            'type': NewPlace.TypeCategory == category.historical ? '1' : '0',
            'regionId': NewPlace.regionId,
            'location': {
              'afress': NewPlace.locations.adress,
              'latitude': NewPlace.locations.Latitude,
              'longitude': NewPlace.locations.Longitude
            },
            'images': NewPlace.Image.map((url) => {
                  'imageUrl': url,
                }).toList(),
            'islike': NewPlace.islike,
          },
        ),
      );
      return jsonDecode(response.body)['name'];
    } catch (e) {
      rethrow;
    }
  }

// ma`lumotlarni FireBasedan (RialTime data baza) dan olish.....

  static Future<List<place>> getDataFromFireBase() async {
    try {
      final respons = await http.get(url);
      final Data = jsonDecode(respons.body) as Map<String, dynamic>;
      // print(respons.body);

      final List<place> loadPlaces = [];

      Data.forEach(
        (PlaceId, Place) {
          loadPlaces.add(
            place(
              id: PlaceId,
              title: Place['title'],
              regionId: Place['regionId'],
              Image: (Place['images'] as List<dynamic>)
                  .map((images) => images['imageUrl'] as String)
                  .toList(),
              descriptions: Place['desc'],
              TypeCategory:
                  Place['type'] == '1' ? category.historical : category.nature,
              locations: Placelocation(
                  adress: Place['location']['afress'],
                  Latitude: Place['location']['latitude'],
                  Longitude: Place['location']['longitude']),
              islike: Place['islike'],
            ),
          );
        },
      );
      return loadPlaces;
    } catch (error) {
      rethrow;
    }
  }

// ma`lumotni sevimlilarga qo`shish  yoki qo`shmaslik haqida FireBasega ma`lumot yuborish.....

  static Future<void> SaveToggleLike(String id, bool islike) async {
    final Url = Uri.parse(
        'https://travelguide-d0410-default-rtdb.firebaseio.com/Places/$id.json');
    try {
      http.patch(
        Url,
        body: jsonEncode(
          {
            'islike': islike,
          },
        ),
      );
    } catch (error) {
      rethrow;
    }
  }
}
