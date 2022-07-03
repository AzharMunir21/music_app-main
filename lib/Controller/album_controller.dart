import 'dart:io';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
class AlbumController extends GetxController {
//.................................. data write portion

  File? imageFile;

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  updateImage(File imageFileValue) {
    imageFile = imageFileValue;
    update();
  }

  Future ImageRef(
    String albumName,
  ) async {
    firebase_storage.Reference ref =
        firebase_storage.FirebaseStorage.instance.ref('$albumName.musicApp');

    firebase_storage.UploadTask uploadTask = ref.putFile(imageFile!.absolute);
    await Future.value(uploadTask);
    var newUrl = await ref.getDownloadURL();

    getAlbumName(albumName, newUrl);
  }

  void getAlbumName(String albumName, String image) async {
    CollectionReference reference = (await FirebaseFirestore.instance
        .collection("Album")
        .doc('Q1RZ6uffWDnlOAfPgNqs')
        .collection('$albumName')
        .add({
      "image": image,
      "albumName": albumName,
    })) as CollectionReference<Object?>;

    // Map<String, String> Album = {
    //   "image": image,
    //   "albumName": albumName,
  }
}
