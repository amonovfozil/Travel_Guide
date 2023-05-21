// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, non_constant_identifier_names

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class HelperFireStorage {
  static Future<List<String>?> saveImagesToFireStorage(
      List<File> SaveFile, String selectRegion, String title) async {
    List<String>? imgesurls;
    List<Future<void>> uploadTasks = [];
    for (int i = 0; i < SaveFile.length; i++) {
      File file = SaveFile[i];
      String fileName = '$title$i';
      // generate a unique name for the file
      Reference ref = FirebaseStorage.instance
          .ref(selectRegion)
          .child(title)
          .child(fileName);
      UploadTask uploadTask = ref.putFile(file);
      // add an event listener to track the upload progress
      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
      });
      uploadTasks.add(uploadTask.whenComplete(() {}));

      final ListResult result = await FirebaseStorage.instance
          .ref()
          .child(selectRegion)
          .child(title)
          .listAll();

      final List<String> urls = [];
      for (final Reference ref in result.items) {
        final url = await ref.getDownloadURL();
        urls.add(url);
      }
      if (urls.isNotEmpty) {
        imgesurls = urls;
      }
    }
    await Future.wait(uploadTasks);
    return imgesurls;
  }
}
