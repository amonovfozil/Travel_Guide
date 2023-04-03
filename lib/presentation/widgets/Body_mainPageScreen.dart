import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/Data/models/regions.dart';

import '../../Data/Providers/Placeprovider.dart';
import '../../Data/models/Model_Places.dart';
import '../../presentation/widgets/Places_list_iteams.dart';

class body_mainpageScreen extends StatelessWidget {
  const body_mainpageScreen({
    Key? key,
    required TabController tabcontroller,
  })  : _tabcontroller = tabcontroller,
        super(key: key);

  final TabController _tabcontroller;

  @override
  Widget build(BuildContext context) {
    final regions = Provider.of<Regions>(context).list;
    return Container(
      height: 380,
      width: double.infinity,
      child: TabBarView(
        children: [
          TabBarView(
            controller: _tabcontroller,
            children: regions
                .map(
                  (reg) => PlacesListIteams(
                      index: regions.indexOf(reg), type: category.historical),
                )
                .toList(),
          ),
          TabBarView(
            controller: _tabcontroller,
            children: regions
                .map(
                  (reg) => PlacesListIteams(
                      index: regions.indexOf(reg), type: category.nature),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
