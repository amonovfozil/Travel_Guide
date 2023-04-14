import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as Firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Data/models/Model_Places.dart';
import '../../Data/Providers/Placeprovider.dart';
import '../../Data/models/regions.dart';
import '../../helper/HelperFireStorage.dart';
import '../../presentation/widgets/SideBar.dart';
import '../../presentation/widgets/select_adress.dart';
import '.././widgets/take_photo.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  List<File>? _SaveFile;
  Placelocation? _PlacesLocation;
  bool typeCategory = true;
  String _selectRegion = 'Toshkent';
  String title = '';
  String Desc = '';
  bool isdone = false;

  final _formkey = GlobalKey<FormState>();

  void getSaveImage(List<File> image) {
    _SaveFile = image;
  }

  void getPickedLocation(String adress, double Latitude, double Longitude) {
    _PlacesLocation =
        Placelocation(adress: adress, Latitude: Latitude, Longitude: Longitude);
  }

  void SubmitStatePlase() async {
    setState(() {
      isdone = true;
    });
    if (_formkey.currentState!.validate() || _SaveFile != null) {
      _formkey.currentState!.save();

      HelperFireStorage.saveImagesToFireStorage(
              _SaveFile!, _selectRegion, title)
          .then((value) {
        if (value != null) {
          Provider.of<Placesproviders>(context, listen: false).addNewPlaces(
            place(
                id: UniqueKey().toString(),
                title: title,
                regionId: Provider.of<Regions>(context, listen: false)
                    .getregionid(_selectRegion),
                Image: value,
                descriptions: Desc,
                TypeCategory:
                    typeCategory ? category.nature : category.historical,
                locations: _PlacesLocation!),
          );
          setState(() {
            isdone = false;
          });
          Navigator.of(context).pushReplacementNamed('/');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final regions = Provider.of<Regions>(context).list;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Yangi Sayohat joyi qo`shish'),
        centerTitle: true,
      ),
      drawer: SideBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButton(
            isExpanded: true,
            value: _selectRegion,
            items: regions.map((reg) {
              return DropdownMenuItem(
                child: Center(child: Text(reg.title)),
                value: reg.title,
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectRegion = value!;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Historical Place'),
                CupertinoSwitch(
                  value: typeCategory,
                  onChanged: (value) {
                    setState(() {
                      typeCategory = value;
                    });
                  },
                ),
                Text('Nature Place'),
              ],
            ),
          ),
          Form(
            key: _formkey,
            child: Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Joy nomi:',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Iltimos joy nomini kiriting';
                          }
                        },
                        onSaved: (newValue) => title = newValue!,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                          labelText: 'Joy haqida qisqacha ma`lumot:',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Iltimos joyga ta`rif bering';
                          }
                        },
                        onSaved: (newValue) => Desc = newValue!,
                      ),
                      SizedBox(height: 10),
                      Takephoto(getSaveImage),
                      SizedBox(height: 10),
                      SelectAdress(getPickedLocation),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: SubmitStatePlase,
            child: isdone
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : const Text('Tayyor'),
            style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: const EdgeInsets.symmetric(vertical: 20)),
          )
        ],
      ),
    );
  }
}
