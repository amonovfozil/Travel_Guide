import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/presentation/Screens/AppInfo_screen.dart';

import '../Data/models/Model_Places.dart';
import '../Data/Providers/Placeprovider.dart';
import '../Data/models/regions.dart';
import '../presentation/Screens/Info_Place.dart';
import '../presentation/Screens/MyHomePage_screen.dart';
import '../presentation/Screens/Upload_Screen.dart';
import '../presentation/Screens/google_map.dart';
import '../presentation/Screens/manegment_state_screen.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await Firebase.initializeApp();
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
          primarySwatch: Colors.grey,
        ),
        home: MyHomePage(),
        routes: {
          'Manegment': (context) => StateManegmentScreen(),
          'AddPlaces': (context) => AddPlaceScreen(),
          'PlaceRegion': (context) => PlacesFromregion(),
          'InfoPlace': (context) => InfoPlaceScreen(),
          'AppInfo': (context) => AppInfo(),
        },
      ),
    );
  }
}
