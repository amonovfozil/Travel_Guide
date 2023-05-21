// ignore_for_file: library_prefixes, non_constant_identifier_names, use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as systemPath;


class Takephoto extends StatefulWidget {
  final Function getSaveimage;
  const Takephoto(this.getSaveimage, {super.key});
  @override
  State<Takephoto> createState() => _TakephotoState();
}

class _TakephotoState extends State<Takephoto> {
  final List<File> _imageFile = [];
  void _takePhotos() async {
    final imagePicker = ImagePicker();
    final Photos = await imagePicker.pickMultiImage();
    setState(() {
      Photos.map(
        (photo) => _imageFile.add(
          File(photo.path),
        ),
      ).toList();
    });
    final pathProvider = await systemPath.getApplicationDocumentsDirectory();

    final List<File> fileAdrees = [];
    _imageFile
        .map((photo) => photo
            .copy('${pathProvider.path}/ ${path.basename(photo.path)}')
            .then((value) => fileAdrees.add(value)))
        .toList();

    widget.getSaveimage(fileAdrees);
    Navigator.of(context).pop();
  }

  void showGetImage() {
    showModalBottomSheet(
      backgroundColor: Colors.white.withOpacity(0.0),
      context: context,
      builder: (ctx) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () => _takePhotos(),
              icon: const Icon(Icons.camera),
              label: const Text(
                'With Galery',
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 80)),
            ),
            const SizedBox(height: 80),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: showGetImage,
      child: Container(
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(7)),
        child: _imageFile.isEmpty
            ? const Center(
                child: Text('Rasm kiriting'),
              )
            : Image.file(
                _imageFile[0],
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
