import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_guide/Data/regions.dart';

part 'region_state.dart';

class RegionCubit extends Cubit<RegionState> {
  RegionCubit()
      : super(
          RegionInitial(
            [
              // region(
              //     id: 'v1',
              //     title: "Andijon",
              //     MapUrl: "assets/images/map/sam.png"),
              region(
                  id: '0',
                  title: "Buxoro",
                  MapUrl: "assets/images/map/bukhara.png"),
              // region(
              //     id: 'v3',
              //     title: "Farg`ona",
              //     MapUrl: "assets/images/map/jiz.png"),
              // region(
              //     id: 'v4',
              //     title: "Jizzax",
              //     MapUrl: "assets/images/map/bukhara.png"),
              // region(
              //     id: 'v5',
              //     title: "Xorazm",
              //     MapUrl: "assets/images/map/sam.png"),
              // region(
              //     id: 'v6',
              //     title: "Namangan",
              //     MapUrl: "assets/images/map/jiz.png"),
              // region(
              //     id: 'v7',
              //     title: "Navoiy",
              //     MapUrl: "assets/images/map/bukhara.png"),
              // region(
              //     id: 'v8',
              //     title: "Qashqadaryo",
              //     MapUrl: "assets/images/map/sam.png"),
              // region(
              //     id: 'v9',
              //     title: "Qoraqalpog`iston.Res",
              //     MapUrl: "assets/images/map/jiz.png"),
              region(
                  id: '1',
                  title: "Samarqand",
                  MapUrl: "assets/images/map/bukhara.png"),
              // region(
              //     id: 'v11',
              //     title: "Sirdaryo",
              //     MapUrl: "assets/images/map/sam.png"),
              // region(
              //     id: 'v12',
              //     title: "Surxandaryo",
              //     MapUrl: "assets/images/map/jiz.png"),
              region(
                  id: '2',
                  title: "Toshkent",
                  MapUrl: "assets/images/map/jiz.png"),
            ],
          ),
        );
}
