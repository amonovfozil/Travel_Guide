// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../Data/models/Model_Places.dart';

class RegionMenu extends StatelessWidget {
  final String title;
  final bool Isselect;
  final category isPage;

  final String imageUrl;
  const RegionMenu({
    Key? key,
    required this.title,
    required this.Isselect,
    required this.isPage,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Isselect ? 145 : 120,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          SizedBox(
            height: Isselect ? 115 : 90,
            width: 120,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
              color: Isselect
                  ? Colors.white
                  : isPage == category.historical
                      ? Colors.blueGrey
                      : Colors.teal.shade900,
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: 110,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: title.length < 12 ? 16 : 12,
                  fontWeight: FontWeight.bold,
                  color: Isselect
                      ? Colors.white
                      : isPage == category.historical
                          ? Colors.blueGrey
                          : Colors.teal.shade800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
