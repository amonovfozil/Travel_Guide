import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/Data/models/Model_Places.dart';
import 'package:travel_guide/Data/models/regions.dart';
import 'package:travel_guide/presentation/Screens/google_map.dart';
import 'package:travel_guide/presentation/widgets/Places_iteams.dart';

class InfoPlaceScreen extends StatelessWidget {
  const InfoPlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PickedPlace =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = PickedPlace['title'] as String;
    final Info = PickedPlace['deck'] as String;
    final images = PickedPlace['images'] as List<String>;
    final location = PickedPlace['location'] as Placelocation;
    final regionid = PickedPlace['region'] as String;
    final regions = Provider.of<Regions>(context).list;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: Text(title),
      //   centerTitle: true,
      // ),
      body: Column(
        children: [
          Stack(
            children: [
              SliderImages(
                  images: images,
                  region: regions[int.parse(regionid)].title,
                  title: title),
              Column(
                children: [
                  SizedBox(height: 500 - 200),
                  Stack(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white.withOpacity(0),
                              Colors.white.withOpacity(0.1),
                              Colors.white.withOpacity(0.1),
                              Colors.white.withOpacity(0.2),
                              Colors.white.withOpacity(0.4),
                              Colors.white.withOpacity(0.5),
                              Colors.white.withOpacity(0.7),
                              Colors.white.withOpacity(0.9),
                              Colors.white.withOpacity(1),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 200,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      Info,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => MapSample(
                        IsSelected: false,
                        placeslocation: location,
                        ismap: false,
                      ),
                    ),
                  ),
                  icon: Icon(
                    Icons.location_on,
                    size: 15,
                  ),
                  label: const Text(
                    'Location',
                    style: TextStyle(fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: const EdgeInsets.symmetric(vertical: 20)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SliderImages extends StatefulWidget {
  final List<String> images;
  final String region;
  final String title;

  const SliderImages(
      {required this.images,
      required this.region,
      required this.title,
      super.key});

  @override
  State<SliderImages> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SliderImages> {
  var indexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(),
              child: CarouselSlider(
                items: widget.images
                    .map(
                      (image) => Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1,
                  enlargeFactor: 0.32,
                  disableCenter: true,
                  onPageChanged: (value, page) {
                    // print(value);
                    setState(() {
                      indexPage = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.images
                  .map(
                    (image) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.5),
                      child: Icon(
                        widget.images.indexOf(image) == indexPage
                            ? Icons.circle
                            : Icons.circle_outlined,
                        color: widget.images.indexOf(image) == indexPage
                            ? Colors.blueGrey
                            : Colors.grey.shade600,
                        size:
                            widget.images.indexOf(image) == indexPage ? 12 : 10,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.3)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(0),
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.region,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
