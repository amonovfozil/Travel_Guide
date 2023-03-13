import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_guide/Data/Model_Places.dart';
import 'package:travel_guide/logic/regions/region_cubit.dart';
import 'package:travel_guide/presentation/widgets/Body_mainPageScreen.dart';
import 'package:travel_guide/presentation/widgets/Places_list_iteams.dart';
import 'package:travel_guide/presentation/widgets/Region_Menu.dart';
import 'package:travel_guide/presentation/widgets/SideBar.dart';

class MainPageScrren extends StatefulWidget {
  const MainPageScrren({super.key});

  @override
  State<MainPageScrren> createState() => _MainPageScrrenState();
}

class _MainPageScrrenState extends State<MainPageScrren>
    with TickerProviderStateMixin {
  late TabController _tabcontroller = TabController(
      length: context.read<RegionCubit>().state.regions.length, vsync: this);
  @override
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int indexImage = 0;
  category page = category.historical;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: page == category.historical
            ? Color.fromRGBO(7, 59, 75, 1)
            : Color.fromRGBO(5, 58, 44, 1),
        drawer: SideBar(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      alignment: Alignment.centerLeft,
                      onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                      icon: Icon(
                        Icons.format_align_left_sharp,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Travel Guide',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    CircleAvatar(
                      radius: 14,
                      backgroundImage: AssetImage('assets/images/Iuser.jpg'),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  'viloyatlat:',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
              BlocBuilder<RegionCubit, RegionState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TabBar(
                      unselectedLabelColor: page == category.historical
                          ? Colors.blueGrey
                          : Colors.teal,
                      splashFactory: NoSplash.splashFactory,
                      indicator: BoxDecoration(),
                      isScrollable: true,
                      controller: _tabcontroller,
                      tabs: state.regions
                          .map(
                            (region) => RegionMenu(
                              title: region.title,
                              imageUrl: region.MapUrl,
                              isPage: page,
                              Isselect:
                                  indexImage == state.regions.indexOf(region),
                            ),
                          )
                          .toList(),
                      onTap: (value) => setState(() {
                        indexImage = value;
                      }),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Container(
                  height: 36,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(3.5),
                    child: TabBar(
                      unselectedLabelColor: Colors.black,
                      labelStyle:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: page == category.historical
                            ? Color.fromRGBO(9, 53, 67, 1)
                            : Color.fromRGBO(2, 72, 52, 0.729),
                      ),
                      tabs: [
                        Tab(
                          text: 'TARIXIY OBIDALARI',
                        ),
                        Tab(
                          text: 'TABIATI',
                        ),
                      ],
                      onTap: (value) {
                        if (value == 0) {
                          setState(() {
                            page = category.historical;
                          });
                        } else {
                          setState(() {
                            page = category.nature;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              body_mainpageScreen(tabcontroller: _tabcontroller),
            ],
          ),
        ),
      ),
    );
  }
}
