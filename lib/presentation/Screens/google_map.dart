import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:path/path.dart';
import 'package:travel_guide/constant/google_maps.dart';
import 'package:travel_guide/presentation/widgets/SideBar.dart';
import '../../Data/models/Model_Places.dart';

class MapSample extends StatefulWidget {
  final Placelocation placeslocation;
  final bool IsSelected;
  final bool ismap;

  const MapSample(
      {required this.IsSelected,
      required this.placeslocation,
      required this.ismap,
      Key? key})
      : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng? _pickedLocation;
  LatLng? _currentlocation;
  double _zoommap = 16;

  final typemap = {
    'normal': MapType.normal,
    'satellite': MapType.satellite,
    'hybrid': MapType.hybrid
  };
  MapType _maptype = MapType.normal;

  void selectLocaation(LatLng location) {
    setState(() {
      _pickedLocation = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
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
          Stack(
            children: [
              GoogleMap(
                mapType: _maptype,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    widget.placeslocation.Latitude,
                    widget.placeslocation.Longitude,
                  ),
                  zoom: widget.ismap
                      ? 10
                      : widget.IsSelected
                          ? _zoommap
                          : 18,
                ),
                onTap:
                    widget.IsSelected ? selectLocaation : (LatLng location) {},
                markers: _pickedLocation == null
                    ? widget.IsSelected
                        ? {}
                        : widget.ismap
                            ? {}
                            : _currentlocation == null
                                ? {
                                    Marker(
                                      markerId: MarkerId('m1'),
                                      position: LatLng(
                                          widget.placeslocation.Latitude,
                                          widget.placeslocation.Longitude),
                                    ),
                                  }
                                : {
                                    Marker(
                                      markerId: MarkerId('m1'),
                                      position: LatLng(
                                          widget.placeslocation.Latitude,
                                          widget.placeslocation.Longitude),
                                    ),
                                    Marker(
                                        markerId: MarkerId('current1'),
                                        position: _currentlocation!)
                                  }
                    : {
                        Marker(
                            markerId: MarkerId('m1'),
                            position: _pickedLocation!),
                      },
                circles: _pickedLocation == null
                    ? {}
                    : {
                        Circle(
                          circleId: CircleId('c1'),
                          center: _pickedLocation!,
                          radius: 50,
                          strokeWidth: 2,
                          strokeColor: Colors.red,
                        ),
                      },
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
