import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/Data/Providers/Placeprovider.dart';
import 'package:travel_guide/presentation/widgets/SideBar.dart';

import '../../Data/models/Model_Places.dart';
import '../../presentation/Screens/favorites_pageScreen.dart';
import '../../presentation/Screens/google_map.dart';
import '../../presentation/Screens/mainPage_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int NavigationPageIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      drawer: SideBar(),
      body: Stack(
        children: [
          NavigationPageIndex == 1
              ? MainPageScrren()
              : NavigationPageIndex == 0
                  ? MapSample(
                      IsSelected: false,
                      placeslocation: Placelocation(
                          adress: 'Toshkent',
                          Latitude: 41.2825125,
                          Longitude: 69.1392805),
                      ismap: true,
                    )
                  : NavigationPageIndex == 2
                      ? FavoritesPage()
                      : const Center(
                          child: Text(
                            'Hali mavjud emas',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
          Positioned(
            left: 12,
            top: 8,
            child: IconButton(
              padding: const EdgeInsets.all(0),
              alignment: Alignment.centerLeft,
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              icon: Icon(
                Icons.format_align_left_sharp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Theme.of(context).primaryColor,
        height: 50,
        backgroundColor: Colors.transparent,
        items: [
          Image.asset(
            'assets/images/earth.png',
            width: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.favorite,
            color: Colors.white,
            size: 30,
          ),
        ],
        index: NavigationPageIndex,
        onTap: (index) {
          setState(
            () {
              NavigationPageIndex = index;
            },
          );
        },
      ),
    );
  }
}
