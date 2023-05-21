// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import '../../Data/models/Model_Places.dart';
import '../../Data/Providers/Placeprovider.dart';

class PlacesListIteams extends StatefulWidget {
  final int index;
  final category type;

  const PlacesListIteams({super.key, 
    required this.index,
    required this.type,
  });

  @override
  State<PlacesListIteams> createState() => _PlacesListIteamsState();
}

class _PlacesListIteamsState extends State<PlacesListIteams> {
  var isloading = false;
  @override
  void initState() {
    isloading = true;
    Future.delayed(Duration.zero).then((value) {
      Provider.of<Placesproviders>(context, listen: false)
          .getDataFromFireBase()
          .then((_) {
        isloading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Places = Provider.of<Placesproviders>(context)
        .placeFilterByRegion(widget.index, widget.type);
    return isloading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : CarouselSlider(
            items: Places.map(
              (places) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Card(
                      margin: const EdgeInsets.all(0),
                      elevation: 11,
                      shadowColor: Colors.black,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: places.Image[0].startsWith('assets/')
                          ? Image.asset(
                              places.Image[0],
                              fit: BoxFit.cover,
                              height: 360,
                              width: 320,
                            )
                          : Image.network(
                              places.Image[0],
                              fit: BoxFit.cover,
                              height: 360,
                              width: 320,
                            ),
                    ),
                    Container(
                      height: 360,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.9),
                            Colors.black.withOpacity(1),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            splashRadius: 20,
                            onPressed: () => Provider.of<Placesproviders>(
                                    context,
                                    listen: false)
                                .ToggleFavority(places.id),
                            icon: places.islike
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 28,
                                  )
                                : const Icon(
                                    Icons.favorite_outline,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                          ),
                          Container(
                            width: 60,
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white.withOpacity(0.5),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '4.6',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                Icon(
                                  Icons.star_rate_rounded,
                                  color: Colors.yellow,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 225,
                      child: Column(
                        children: [
                          Text(
                            places.title,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 6),
                          SizedBox(
                            width: 210,
                            child: Text(
                              places.descriptions,
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              style: TextStyle(
                                wordSpacing: 1,
                                height: 1.3,
                                fontStyle: FontStyle.italic,
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed('InfoPlace', arguments: {
                            'title': places.title,
                            'deck': places.descriptions,
                            'images': places.Image,
                            'location': places.locations,
                            'region':places.regionId,
                          }),
                          child: Container(
                            height: 45,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 1, color: Colors.grey)),
                            child: const Center(
                                child: Text(
                              'Batafsil...',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            )),
                          ),
                        )),
                  ],
                ),
              ),
            ).toList(),
            options: CarouselOptions(
              viewportFraction: 0.73,
              enlargeCenterPage: true,
              enlargeFactor: 0.32,
              disableCenter: true,
              clipBehavior: Clip.hardEdge,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              
            ),
          );
  }
}
