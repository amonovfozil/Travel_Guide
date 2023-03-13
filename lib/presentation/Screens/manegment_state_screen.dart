import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Model_Places.dart';
import '../../Data/regions.dart';
import '../../logic/Trip/TripPlaces_cubit.dart';
import '../../logic/regions/region_cubit.dart';

class StateManegmentScreen extends StatelessWidget {
  const StateManegmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final regions = context.read<RegionCubit>().state.regions;
    return Scaffold(
      appBar: AppBar(
        title: Text('Ma`lumotlarni boshqarish'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: regions
              .map(
                (region) => InkWell(
                  onTap: () => Navigator.of(context).pushNamed('PlaceRegion',
                      arguments: {'id': region.id, 'region': region.title}),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          region.MapUrl,
                        ),
                      ),
                      title: Text(
                        region.title,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class PlacesFromregion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final regionId = Data['id'];
    final regionTitle = Data['region'];
    return Scaffold(
      appBar: AppBar(
        title: Text(regionTitle),
        centerTitle: true,
      ),
      body: BlocBuilder<TripPlacesCubit, TripPlacesState>(
        builder: (context, state) {
          List<place> Places = context
              .read<TripPlacesCubit>()
              .placeFilterByRegion(int.parse(regionId));
          return SingleChildScrollView(
            child: Column(
              children: Places.map(
                (places) => Card(
                  child: ListTile(
                    leading: Container(
                      clipBehavior: Clip.hardEdge,
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        places.ImagesUrl[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(places.title),
                  ),
                ),
              ).toList(),
            ),
          );
        },
      ),
    );
  }
}
