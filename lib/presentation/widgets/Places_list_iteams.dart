import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_guide/Data/Model_Places.dart';
import 'package:travel_guide/logic/Trip/TripPlaces_cubit.dart';

class PlacesListIteams extends StatelessWidget {
  final int index;
  final category type;

  PlacesListIteams({
    required this.index,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripPlacesCubit, TripPlacesState>(
      builder: (context, state) {
        List<place> Placess =
            context.read<TripPlacesCubit>().placeFilterByRegion(index, type);
        return CarouselSlider(
          items: Placess.map(
            (places) => Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.6),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    places.ImagesUrl[0],
                    fit: BoxFit.cover,
                    height: 340,
                    width: 280,
                  ),
                ),
                Container(
                  height: 340,
                  width: 280,
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
                        onPressed: () => context
                            .read<TripPlacesCubit>()
                            .ToggleFavority(places.id),
                        icon: places.islike
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 28,
                              )
                            : Icon(
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
                        child: Row(
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

                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(
                      //     Icons.photo_library_sharp,
                      //     color: Colors.white,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Positioned(
                  top: 190,
                  child: Column(
                    children: [
                      Text(
                        places.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 210,
                        child: Text(
                          places.descriptions,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: TextStyle(
                            wordSpacing: 1,
                            height: 1.3,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        'Info',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      )),
                    )),
              ],
            ),
          ).toList(),
          options: CarouselOptions(
            viewportFraction: 0.65,
            enlargeCenterPage: true,
            enlargeFactor: 0.32,
            disableCenter: true,
          ),
        );
      },
    );
  }
}