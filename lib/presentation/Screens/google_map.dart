import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Data/models/Model_Places.dart';

class MapSample extends StatefulWidget {
  final Placelocation placeslocation;
  final bool IsSelected;

  const MapSample(
      {required this.IsSelected, required this.placeslocation, Key? key})
      : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  LatLng? _pickedLocation;
  MapType _maptype = MapType.normal;
  final typemap = {
    'Normal': MapType.normal,
    'terrain': MapType.terrain,
    'hybrid': MapType.hybrid
  };
  void selectLocaation(LatLng location) {
    setState(() {
      _pickedLocation = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Xarita',
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (ctx) {
              return typemap.keys
                  .toList()
                  .map(
                    (Type) => PopupMenuItem(
                      child: Text(Type),
                      value: typemap[Type],
                    ),
                  )
                  .toList();
            },
            onSelected: (value) {
              setState(() {
                _maptype = value;
              });
            },
          ),
          if (widget.IsSelected)
            IconButton(
              onPressed: _pickedLocation == null
                  ? null
                  : () => Navigator.of(context).pop(_pickedLocation),
              icon: Icon(
                Icons.check,
              ),
            ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: _maptype,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                widget.placeslocation.Latitude,
                widget.placeslocation.Longitude,
              ),
              zoom: widget.IsSelected ? 16 : 10,
            ),
            onTap: widget.IsSelected ? selectLocaation : (LatLng location) {},
            markers: _pickedLocation == null
                ? {}
                : {
                    Marker(
                      markerId: MarkerId('m1'),
                      position: _pickedLocation!,
                    ),
                  },
            circles: _pickedLocation == null
                ? {}
                : {
                    Circle(
                        circleId: CircleId('c1'),
                        center: _pickedLocation!,
                        radius: 50,
                        strokeWidth: 2,
                        strokeColor: Colors.red),
                  },
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
          ),
        ],
      ),
    );
  }
}
