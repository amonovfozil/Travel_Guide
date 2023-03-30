import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as systemPath;

class Takephoto extends StatefulWidget {
  final Function getSaveimage;
  Takephoto(this.getSaveimage);
  @override
  State<Takephoto> createState() => _TakephotoState();
}

class _TakephotoState extends State<Takephoto> {
  File? _imageFile;
  void _takePhotos(ImageSource sources) async {
    final imagePicker = ImagePicker();
    final Photo = await imagePicker.pickImage(source: sources);
    if (Photo != null) {
      setState(() {
        _imageFile = File(Photo.path);
      });
      final pathProvider = await systemPath.getApplicationDocumentsDirectory();
      final filename = path.basename(Photo.path);
      final FileAdress =
          await _imageFile!.copy('${pathProvider.path}/$filename');
      widget.getSaveimage(FileAdress);
      print(FileAdress);
    }
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
              onPressed: () => _takePhotos(ImageSource.camera),
              icon: Icon(Icons.photo_camera),
              label: Text(
                'With camera',
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 80)),
            ),
            Text(
              'or',
              style: TextStyle(color: Colors.white),
            ),
            ElevatedButton.icon(
              onPressed: () => _takePhotos(ImageSource.gallery),
              icon: Icon(Icons.camera),
              label: Text(
                'With Galery',
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 80)),
            ),
            SizedBox(height: 80),
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
        child: _imageFile == null
            ? const Center(
                child: Text('Rasm kiriting'),
              )
            : Image.file(
                _imageFile!,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
