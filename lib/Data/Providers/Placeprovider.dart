
// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:travel_guide/Data/data.dart';

import '../../dataBase/connect_fireBase/FireBaseData.dart';
import '../../Data/models/Model_Places.dart';

class Placesproviders with ChangeNotifier {
  // List<place> _places = [];
  Future<void> getDataFromFireBase() async {
    await FireBaseData.getDataFromFireBase().then(
      (loadPlaces) {
        DataPlaces.listPlace = loadPlaces;
        // _Places = loadPlaces;
        notifyListeners();
      },
    );
  }

  void addNewPlaces(place NewPlace) {
    FireBaseData.SendDataToFireBase(NewPlace).then((value) {
      place newPlaces = place(
        id: value,
        title: NewPlace.title,
        regionId: NewPlace.regionId,
        Image: NewPlace.Image,
        descriptions: NewPlace.descriptions,
        TypeCategory: NewPlace.TypeCategory,
        locations: NewPlace.locations,
      );
      DataPlaces.listPlace.add(newPlaces);
      notifyListeners();
    });
  }

  List<place> get PlacesList {
    return DataPlaces.listPlace;
  }

  List<place> placeFilterByRegion(var index, [category? type]) {
    return DataPlaces.listPlace
        .where((element) => type == null
            ? element.regionId == index.toString()
            : element.regionId == index.toString() &&
                element.TypeCategory == type)
        .toList();
  }

  List<place> favorityPlaces() {
    return DataPlaces.listPlace.where((element) => element.islike).toList();
  }

  void ToggleFavority(String id) {
    final SelectPlaces =
        DataPlaces.listPlace.firstWhere((element) => element.id == id);
    SelectPlaces.islike = !SelectPlaces.islike;
    FireBaseData.SaveToggleLike(id, SelectPlaces.islike);
    notifyListeners();
  }
}
