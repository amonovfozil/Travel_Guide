import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/Data/Model_Places.dart';
import 'package:travel_guide/presentation/widgets/SideBar.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Favorites = Provider.of<Placess>(context).favorityPlaces();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sevimlilar',
        ),
        centerTitle: true,
      ),
      drawer: SideBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Favorites.isNotEmpty
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 4 / 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemCount: Favorites.length,
                  itemBuilder: (contex, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: GridTile(
                        child: Container(
                          height: 220,
                          width: double.infinity,
                          child: Image.asset(
                            Favorites[index].ImagesUrl[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                        footer: Container(
                          height: 60,
                          color: Colors.black.withOpacity(0.6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                splashRadius: 20,
                                onPressed: () => Provider.of<Placess>(context)
                                    .ToggleFavority(Favorites[index].id),
                                icon: Favorites[index].islike
                                    ? Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : Icon(
                                        Icons.favorite_outline,
                                        color: Colors.grey,
                                      ),
                              ),
                              Text(
                                Favorites[index].title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.location_on,
                                    size: 28,
                                    color: Colors.white,
                                  ))
                            ],
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
