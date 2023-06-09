// ignore_for_file: file_names, prefer_final_fields, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Data/models/Model_Places.dart';
import '../../Data/models/regions.dart';
import '../widgets/Body_mainPage.dart';
import '../../presentation/widgets/Region_Menu.dart';
import '../../presentation/widgets/SideBar.dart';

class MainPageScrren extends StatefulWidget {
  const MainPageScrren({super.key});

  @override
  State<MainPageScrren> createState() => _MainPageScrrenState();
}

class _MainPageScrrenState extends State<MainPageScrren>
    with TickerProviderStateMixin {
  late TabController _tabcontroller = TabController(
      length: Provider.of<Regions>(context).list.length, vsync: this);
  int indexImage = 0;
  category page = category.historical;

  @override
  Widget build(BuildContext context) {
    final regions = Provider.of<Regions>(context).list;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: page == category.historical
            ? const Color.fromARGB(245, 0, 0, 0).withBlue(70).withGreen(50)
            : const Color.fromARGB(246, 0, 0, 0).withBlue(40).withGreen(50),
        drawer: const SideBar(),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 20),
                      const Text(
                        'Travel Guide',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        width: 45,
                        child: Image.asset('assets/icon/icon.png'),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    'viloyatlat:',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TabBar(
                    splashFactory: NoSplash.splashFactory,
                    indicator: const BoxDecoration(),
                    isScrollable: true,
                    controller: _tabcontroller,
                    tabs: regions
                        .map(
                          (region) => RegionMenu(
                            title: region.title,
                            imageUrl: region.MapUrl,
                            isPage: page,
                            Isselect: indexImage == regions.indexOf(region),
                          ),
                        )
                        .toList(),
                    onTap: (value) => setState(() {
                      indexImage = value;
                    }),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade500,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: TabBar(
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        labelStyle: const TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w600),
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: page == category.historical
                              ? const Color.fromRGBO(9, 53, 67, 1)
                              : const Color.fromRGBO(2, 72, 52, 0.729),
                        ),
                        tabs: const [
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
                const SizedBox(height: 15),
                body_mainpageScreen(tabcontroller: _tabcontroller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
