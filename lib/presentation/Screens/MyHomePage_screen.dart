import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/presentation/Screens/favorites_pageScreen.dart';
import 'package:travel_guide/presentation/Screens/mainPage_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int NavigationPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: NavigationPageIndex == 0
          ? MainPageScrren()
          : NavigationPageIndex == 2
              ? FavoritesPage()
              : const Center(
                  child: Text(
                    'Hali mavjud emas',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
      bottomNavigationBar: Container(
        height: 60,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).primaryColor,
          selectedIconTheme: IconThemeData(color: Colors.white, size: 27),
          unselectedIconTheme: IconThemeData(color: Colors.black54, size: 27),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.location_pin,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: '',
            ),
          ],
          currentIndex: NavigationPageIndex,
          onTap: (index) {
            setState(
              () {
                NavigationPageIndex = index;
              },
            );
          },
        ),
      ),
    );
  }
}
