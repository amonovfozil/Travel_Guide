import 'package:flutter/material.dart';
import 'package:travel_guide/Data/Model_Places.dart';
import 'package:travel_guide/presentation/widgets/Places_list_iteams.dart';

class body_mainpageScreen extends StatelessWidget {
  const body_mainpageScreen({
    Key? key,
    required TabController tabcontroller,
  })  : _tabcontroller = tabcontroller,
        super(key: key);

  final TabController _tabcontroller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: double.infinity,
      child: TabBarView(
        children: [
          TabBarView(
            controller: _tabcontroller,
            children: [
              PlacesListIteams(index: 0, type: category.historical),
              PlacesListIteams(index: 1, type: category.historical),
              PlacesListIteams(index: 2, type: category.historical),
              PlacesListIteams(index: 3, type: category.historical),
              PlacesListIteams(index: 4, type: category.historical),
              PlacesListIteams(index: 5, type: category.historical),
              PlacesListIteams(index: 6, type: category.historical),
              PlacesListIteams(index: 7, type: category.historical),
              PlacesListIteams(index: 8, type: category.historical),
              PlacesListIteams(index: 9, type: category.historical),
              PlacesListIteams(index: 10, type: category.historical),
              PlacesListIteams(index: 11, type: category.historical),
              PlacesListIteams(index: 12, type: category.historical),
            ],
          ),
          TabBarView(
            controller: _tabcontroller,
            children: [
              PlacesListIteams(index: 0, type: category.nature),
              PlacesListIteams(index: 1, type: category.nature),
              PlacesListIteams(index: 2, type: category.nature),
              PlacesListIteams(index: 3, type: category.nature),
              PlacesListIteams(index: 4, type: category.nature),
              PlacesListIteams(index: 5, type: category.nature),
              PlacesListIteams(index: 6, type: category.nature),
              PlacesListIteams(index: 7, type: category.nature),
              PlacesListIteams(index: 8, type: category.nature),
              PlacesListIteams(index: 9, type: category.nature),
              PlacesListIteams(index: 10, type: category.nature),
              PlacesListIteams(index: 11, type: category.nature),
              PlacesListIteams(index: 12, type: category.nature),
            ],
          ),
        ],
      ),
    );
  }
}
