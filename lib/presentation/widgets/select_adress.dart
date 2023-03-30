import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:travel_guide/Data/Model_Places.dart';
import 'package:travel_guide/helper/location_helper.dart';
import 'package:travel_guide/presentation/Screens/google_map.dart';

class SelectAdress extends StatefulWidget {
  const SelectAdress({super.key});

  @override
  State<SelectAdress> createState() => _SelectAdressState();
}

class _SelectAdressState extends State<SelectAdress> {
  String? _adressImage;
  Future<void> getCurrientLocation() async {
    final currient = await Location().getLocation();
    final staticMapImg = locationHelper.getLocationImg(
        latitud: currient.latitude!, longtitud: currient.longitude!);
    setState(() {
      _adressImage = staticMapImg;
    });

    Navigator.of(context).pop();
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
                final selectedLocation = await Navigator.of(context)
                    .push<LatLng>(MaterialPageRoute(
                        builder: (ctx) => MapSample(
                            IsSelected: true,
                            placeslocation: Placelocation(
                                adress: 'tashkent',
                                Latitude: 39.6779101,
                                Longitude: 66.9188384))));
                if (selectedLocation != null) {
                  setState(() {
                    _adressImage = locationHelper.getLocationImg(
                        latitud: selectedLocation.latitude,
                        longtitud: selectedLocation.longitude);
                  });
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
