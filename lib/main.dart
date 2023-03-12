import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_guide/logic/Trip/TripPlaces_cubit.dart';
import 'package:travel_guide/logic/regions/region_cubit.dart';
import 'package:travel_guide/presentation/Screens/MyHomePage_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegionCubit(),
        ),
        BlocProvider(
          create: (context) => TripPlacesCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: MyHomePage(),
        routes: {},
      ),
    );
  }
}
