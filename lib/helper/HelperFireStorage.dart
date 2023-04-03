import 'dart:io';
import 'package:flutter/material.dart';

import 'package:firebase_storage/firebase_storage.dart';

class HelperFireStorage {
  static Future<List<String>?> saveImagesToFireStorage(
      List<File> _SaveFile, String _selectRegion, String title) async {
    List<String>? _imgesurls;
    List<Future<void>> uploadTasks = [];
    for (int i = 0; i < _SaveFile.length; i++) {
      File file = _SaveFile[i];
      String fileName = '$title$i';
      // generate a unique name for the file
      Reference ref = FirebaseStorage.instance
          .ref('$_selectRegion')
          .child('$title')
          .child(fileName);
      UploadTask uploadTask = ref.putFile(file);
      // add an event listener to track the upload progress
      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        double progress = snapshot.bytesTransferred / snapshot.totalBytes;
      });
      uploadTasks.add(uploadTask.whenComplete(() {}));

      final ListResult result = await FirebaseStorage.instance
          .ref()
          .child('$_selectRegion')
          .child("$title")
          .listAll();

      final List<String> urls = [];
      for (final Reference ref in result.items) {
        final url = await ref.getDownloadURL();
        urls.add(url);
      }
      if (urls.isNotEmpty) {
        _imgesurls = urls;
      }
    }
    await Future.wait(uploadTasks);
    return _imgesurls;
  }
}
