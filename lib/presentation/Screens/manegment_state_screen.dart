import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/Data/Model_Places.dart';
import 'package:travel_guide/Data/Providers/Placeprovider.dart';
import 'package:travel_guide/Data/regions.dart';
import 'package:travel_guide/presentation/widgets/SideBar.dart';

class StateManegmentScreen extends StatelessWidget {
  const StateManegmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final regions = Provider.of<Regions>(context).list;
    return Scaffold(
      appBar: AppBar(
        title: Text('Ma`lumotlarni boshqarish'),
        centerTitle: true,
      ),
      drawer: SideBar(),
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
    final Places =
        Provider.of<Placesproviders>(context).placeFilterByRegion(regionId);
    return Scaffold(
        appBar: AppBar(
          title: Text(regionTitle),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, 'AddPlaces'),
                icon: Icon(Icons.add))
          ],
        ),
        body: SingleChildScrollView(
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
                    child: places.Image[0].startsWith('asssets/')
                        ? Image.asset(places.Image[0])
                        : Image.file(
                            places.Image[0],
                            fit: BoxFit.cover,
                          ),
                  ),
                  title: Text(places.title),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                    ),
                  ),
                ),
              ),
            ).toList(),
          ),
        ));
  }
}
