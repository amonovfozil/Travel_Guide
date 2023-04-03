import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/Data/models/Model_Places.dart';
import 'package:travel_guide/Data/Providers/Placeprovider.dart';
import 'package:travel_guide/Data/models/regions.dart';
import 'package:travel_guide/presentation/Screens/MyHomePage_screen.dart';
import 'package:travel_guide/presentation/Screens/add_Place_Screen.dart';
import 'package:travel_guide/presentation/Screens/manegment_state_screen.dart';

import 'package:firebase_storage/firebase_storage.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Regions(),
        ),
        ChangeNotifierProvider(
          create: (context) => Placesproviders(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Travel Guide',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: MyHomePage(),
        routes: {
          'Manegment': (context) => StateManegmentScreen(),
          'AddPlaces': (context) => AddPlaceScreen(),
          'PlaceRegion': (context) => PlacesFromregion()
        },
      ),
    );
  }
}
