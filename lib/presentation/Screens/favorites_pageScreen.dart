// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:travel_guide/presentation/Screens/google_map.dart';

import '../../Data/Providers/Placeprovider.dart';
import '../../Data/models/Model_Places.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Favorites = Provider.of<Placesproviders>(context).favorityPlaces();
    // print(Favorites);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text(
          'Sevimlilar',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Favorites.isNotEmpty
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 4 / 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemCount: Favorites.length,
                  itemBuilder: (contex, index) {
                    place places = Favorites[index];
                    return InkWell(
                      onTap: () => Navigator.of(context)
                          .pushNamed('InfoPlace', arguments: {
                        'title': places.title,
                        'deck': places.descriptions,
                        'images': places.Image,
                        'location': places.locations,
                        'region': places.regionId,
                      }),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: GridTile(
                          footer: Container(
                            height: 60,
                            color: Colors.black.withOpacity(0.6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                        )
                                      : const Icon(
                                          Icons.favorite_outline,
                                          color: Colors.grey,
                                        ),
                                ),
                                Text(
                                  places.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () => Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (ctx) => MapSample(
                                            IsSelected: false,
                                            placeslocation: places.locations,
                                            ismap: false,
                                          ),
                                        )),
                                    icon: const Icon(
                                      Icons.location_on,
                                      size: 28,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          ),
                          child: SizedBox(
                            height: 220,
                            width: double.infinity,
                            child: places.Image[0].startsWith('assets/')
                                ? Image.asset(places.Image[0],
                                    fit: BoxFit.cover)
                                : Image.network(
                                    places.Image[0],
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text('Hozircha sevimli mavjud emas'),
                ),
        ),
      ),
    );
  }
}
