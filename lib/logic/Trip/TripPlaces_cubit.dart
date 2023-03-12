import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:travel_guide/Data/Model_Places.dart';

part 'TripPlaces_state.dart';

class TripPlacesCubit extends Cubit<TripPlacesState> {
  TripPlacesCubit()
      : super(
          Initialplaces(
            [
              place(
                id: UniqueKey().toString(),
                title: 'Ark Qo`rg`oni',
                regionId: '0',
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
                regionId: '0',
                ImagesUrl: [
                  'assets/images/Regions/minor1.jpg',
                  'assets/images/Regions/minor2.jpg',
                  'assets/images/Regions/minor3.jpg'
                ],
                descriptions:
                    'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
                deteils: 'tarixiy obidalar va ko`rgazmalarga boy',
                TypeCategory: category.historical,
                locations: 'locations',
              ),
              place(
                id: UniqueKey().toString(),
                title: 'Ismoil Samoniy Maqbarasi',
                regionId: '0',
                ImagesUrl: [
                  'assets/images/Regions/sa1.jpg',
                  'assets/images/Regions/sa2.jpg',
                  'assets/images/Regions/sa3.jpg'
                ],
                descriptions:
                    'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
                deteils: 'tarixiy obidalar va ko`rgazmalarga boy',
                TypeCategory: category.historical,
                locations: 'locations',
              ),
              place(
                id: UniqueKey().toString(),
                title: 'Registon',
                regionId: '1',
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
                regionId: '1',
                ImagesUrl: [
                  'assets/images/Regions/sam/go`.jpg',
                  'assets/images/Regions/sam/go2.jpg',
                  'assets/images/Regions/sam/go3.jpg',
                ],
                descriptions:
                    'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
                deteils: 'tarixiy obidalar va ko`rgazmalarga boy',
                TypeCategory: category.historical,
                locations: 'locations',
              ),
              place(
                id: UniqueKey().toString(),
                title: 'Bibixonim',
                regionId: '1',
                ImagesUrl: [
                  'assets/images/Regions/sam/bi1.jpg',
                  'assets/images/Regions/sam/bi2.jpg',
                  'assets/images/Regions/sam/bi3.jpg',
                ],
                descriptions:
                    'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
                deteils: 'tarixiy obidalar va ko`rgazmalarga boy',
                TypeCategory: category.historical,
                locations: 'locations',
              ),
              place(
                id: UniqueKey().toString(),
                title: 'Ko‘kaldosh madrasasi',
                regionId: '2',
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
                regionId: '2',
                ImagesUrl: [
                  'assets/images/Regions/tosh/ba1.jpg',
                  'assets/images/Regions/tosh/ba2.jpg',
                  'assets/images/Regions/tosh/ba3.jpg',
                ],
                descriptions:
                    'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
                deteils: 'tarixiy obidalar va ko`rgazmalarga boy',
                TypeCategory: category.historical,
                locations: 'locations',
              ),
              place(
                id: UniqueKey().toString(),
                title: 'Hazrati Imom',
                regionId: '2',
                ImagesUrl: [
                  'assets/images/Regions/tosh/ha1.jpg',
                  'assets/images/Regions/tosh/ha2.png',
                  'assets/images/Regions/tosh/ha3.jpg',
                ],
                descriptions:
                    'juda chiroyli joy ,tarixiy obidalar va ko`rgazmalarga boy',
                deteils: 'tarixiy obidalar va ko`rgazmalarga boy',
                TypeCategory: category.historical,
                locations: 'locations',
              ),
            ],
          ),
        );
  List<place> placeFilterByRegion(int index, category type) {
    return state.Places.where((element) =>
        element.regionId == index.toString() &&
        element.TypeCategory == type).toList();
  }

  void ToggleFavority(String id) {
    final SelectPlaces = state.Places.firstWhere((element) => element.id == id);
    SelectPlaces.islike = !SelectPlaces.islike;
    emit(TogglePlaces(state.Places));
    print(SelectPlaces.islike);
  }

  List<place> favorityPlaces() {
    return state.Places.where((element) => element.islike).toList();
  }
}
