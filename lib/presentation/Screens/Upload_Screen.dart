// ignore_for_file: file_names, duplicate_ignore, non_constant_identifier_names

// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Data/Providers/Placeprovider.dart';
import '../../Data/models/Model_Places.dart';
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
        title: const Text('Yangi Sayohat joyi qo`shish'),
        centerTitle: true,
      ),
      drawer: const SideBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButton(
            isExpanded: true,
            value: _selectRegion,
            items: regions.map((reg) {
              return DropdownMenuItem(
                value: reg.title,
                child: Center(child: Text(reg.title)),
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
                const Text('Historical Place'),
                CupertinoSwitch(
                  value: typeCategory,
                  onChanged: (value) {
                    setState(() {
                      typeCategory = value;
                    });
                  },
                ),
                const Text('Nature Place'),
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
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Joy nomi:',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Iltimos joy nomini kiriting';
                          }
                          return null;
                        },
                        onSaved: (newValue) => title = newValue!,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        maxLines: 3,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                          labelText: 'Joy haqida qisqacha ma`lumot:',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Iltimos joyga ta`rif bering';
                          }
                          return null;
                        },
                        onSaved: (newValue) => Desc = newValue!,
                      ),
                      const SizedBox(height: 10),
                      Takephoto(getSaveImage),
                      const SizedBox(height: 10),
                      SelectAdress(getPickedLocation),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: SubmitStatePlase,
            style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: const EdgeInsets.symmetric(vertical: 20)),
            child: isdone
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : const Text('Tayyor'),
          )
        ],
      ),
    );
  }
}
