import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_guide/Data/regions.dart';

part 'region_state.dart';

class RegionCubit extends Cubit<RegionState> {
  RegionCubit()
      : super(
          RegionInitial(
            [
              region(
                  id: '0',
                  title: "Qoraqalpog`iston Respublikasi",
                  MapUrl: "assets/images/map/nukus.png"),
              region(
                  id: '1',
                  title: "Andijon",
                  MapUrl: "assets/images/map/andij.png"),
              region(
                  id: '2',
                  title: "Buxoro",
                  MapUrl: "assets/images/map/Buxoro.png"),
              region(
                  id: '3',
                  title: "Farg`ona",
                  MapUrl: "assets/images/map/farg.png"),
              region(
                  id: '4',
                  title: "Jizzax",
                  MapUrl: "assets/images/map/jiz.png"),
              region(
                  id: '5',
                  title: "Xorazm",
                  MapUrl: "assets/images/map/xorazm.png"),
              region(
                  id: '6',
                  title: "Namangan",
                  MapUrl: "assets/images/map/naman.png"),
              region(
                  id: '7',
                  title: "Samarqand",
                  MapUrl: "assets/images/map/Qarshi.png"),
              region(
                  id: '8',
                  title: "Navoiy",
                  MapUrl: "assets/images/map/Navoi.png"),
              region(
                  id: '9',
                  title: "Sirdaryo",
                  MapUrl: "assets/images/map/SirDar.png"),
              region(
                  id: '10',
                  title: "Qashqadaryo",
                  MapUrl: "assets/images/map/Qarshi.png"),
              region(
                  id: '11',
                  title: "Surxandaryo",
                  MapUrl: "assets/images/map/Surxan.png"),
              region(
                  id: '12',
                  title: "Toshkent",
                  MapUrl: "assets/images/map/Tosh.png"),
            ],
          ),
        );
}
