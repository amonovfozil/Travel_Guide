import 'package:flutter/cupertino.dart';

class region {
  final String id;
  final String title;
  final String MapUrl;

  region({
    required this.id,
    required this.title,
    required this.MapUrl,
  });
}

class Regions with ChangeNotifier {
  List<region> _regions = [
    region(
        id: '0',
        title: "Qoraqalpog`iston Respublikasi",
        MapUrl: "assets/images/map/nukus.png"),
    region(id: '1', title: "Toshkent", MapUrl: "assets/images/map/Tosh.png"),
    region(id: '2', title: "Andijon", MapUrl: "assets/images/map/andij.png"),
    region(id: '3', title: "Buxoro", MapUrl: "assets/images/map/Buxoro.png"),
    region(id: '4', title: "Farg`ona", MapUrl: "assets/images/map/farg.png"),
    region(id: '5', title: "Jizzax", MapUrl: "assets/images/map/jiz.png"),
    region(id: '6', title: "Xorazm", MapUrl: "assets/images/map/xorazm.png"),
    region(id: '7', title: "Namangan", MapUrl: "assets/images/map/naman.png"),
    region(id: '8', title: "Samarqand", MapUrl: "assets/images/map/Qarshi.png"),
    region(id: '9', title: "Navoiy", MapUrl: "assets/images/map/Navoi.png"),
    region(id: '10', title: "Sirdaryo", MapUrl: "assets/images/map/SirDar.png"),
    region(
        id: '11', title: "Qashqadaryo", MapUrl: "assets/images/map/Qarshi.png"),
    region(
        id: '12', title: "Surxandaryo", MapUrl: "assets/images/map/Surxan.png"),
  ];
  List<region> get list {
    return _regions;
  }

  String getregionid(String title) {
    return _regions.firstWhere((element) => element.title == title).id;
  }
}
