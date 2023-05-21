import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../presentation/Screens/Home_screen.dart';
import '../../presentation/Screens/AppInfo_screen.dart';
import '../../presentation/Screens/InfoPlace_screen.dart';

import '../Data/Providers/Placeprovider.dart';
import '../Data/models/regions.dart';
import '../presentation/Screens/Upload_Screen.dart';
import '../presentation/Screens/manegment_state_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await Firebase.initializeApp();
  runApp(const MyApp());
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
        home: const MyHomePage(),
        routes: {
          'Manegment': (context) => const StateManegmentScreen(),
          'AddPlaces': (context) => const AddPlaceScreen(),
          'PlaceRegion': (context) => PlacesFromregion(),
          'InfoPlace': (context) =>   const InfoPlaceScreen(),
          'AppInfo': (context) => const AppInfo(),
        },
      ),
    );
  }
}
