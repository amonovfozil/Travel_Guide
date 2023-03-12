import 'package:flutter/material.dart';
import 'package:travel_guide/Data/Model_Places.dart';
import 'package:travel_guide/Data/regions.dart';

class RegionMenu extends StatelessWidget {
  final String title;
  final bool Isselect;
  final category isPage;

  final String imageUrl;
  RegionMenu({
    required this.title,
    required this.Isselect,
    required this.imageUrl,
    required this.isPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Isselect ? 110 : 95,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          SizedBox(
            height: Isselect ? 85 : 70,
            width: 100,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
              color: Isselect
                  ? Colors.white
                  : isPage == category.historical
                      ? Colors.blueGrey
                      : Colors.teal.shade700,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
