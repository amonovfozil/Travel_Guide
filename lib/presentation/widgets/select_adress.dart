import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Data/models/Model_Places.dart';
import '../../helper/location_helper.dart';
import '../../presentation/Screens/google_map.dart';

class SelectAdress extends StatefulWidget {
  final Function getPickedLocation;
  SelectAdress(this.getPickedLocation, {super.key});

  @override
  State<SelectAdress> createState() => _SelectAdressState();
}

class _SelectAdressState extends State<SelectAdress> {
  String? _adressImage;
  Future<void> getCurrientLocation() async {
    final currient = await Location().getLocation();
    getlocationIMG(LatLng(currient.latitude!, currient.longitude!));
    Navigator.of(context).pop();
  }

  void getlocationIMG(LatLng location) async {
    setState(() {
      _adressImage = locationHelper.getLocationImg(
          latitud: location.latitude, longtitud: location.longitude);
    });
    final adressformat = await locationHelper.getSelectlocationAdrees(location);
    widget.getPickedLocation(
        adressformat, location.latitude, location.longitude);
  }

  void showGetImage() {
    showModalBottomSheet(
      backgroundColor: Colors.white.withOpacity(0.0),
      context: context,
      builder: (ctx) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: getCurrientLocation,
              icon: Icon(Icons.location_on),
              label: Text(
                'Mening manzilim',
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 80)),
            ),
            Text(
              'or',
              style: TextStyle(color: Colors.white),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                final selectedLocation =
                    await Navigator.of(context).push<LatLng>(MaterialPageRoute(
                        builder: (ctx) => MapSample(
                              IsSelected: true,
                              placeslocation: Placelocation(
                                  adress: 'tashkent',
                                  Latitude: 39.6779101,
                                  Longitude: 66.9188384),
                              ismap: false,
                            )));
                print('$selectedLocation salom');
                if (selectedLocation != null) {
                  getlocationIMG(selectedLocation);
                }
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.map),
              label: Text(
                'Xaritani ochish',
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 80)),
            ),
            SizedBox(height: 80),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: showGetImage,
      child: Container(
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(7)),
        child: _adressImage == null
            ? const Center(child: Text('manzil tanlanmadi'))
            : Image.network(
                _adressImage!,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
