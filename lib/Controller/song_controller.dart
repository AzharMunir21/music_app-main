import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../View/Screens/Home/home_view.dart';
import 'album_controller.dart';

class SongController extends GetxController {
  List<AlbumNameType> albumNameList = [];
  List<AlbumNameType> newAlbumNameList = [];
  late final AlbumNameType albumNameType;
  // List<AlbumNameType> albumList = [];
  AlbumController controller = Get.put(AlbumController());
  TextEditingController controllerforSingerName = TextEditingController();
  TextEditingController controllerforSongName = TextEditingController();

  // var newUrl;
  File? imageFile;
  List<String>? albumList;
  String? selectAlbum;

  setSelectedAlbum(String newvalue) {
    selectAlbum = newvalue;
    update();
    print(selectAlbum);
  }

  @override
  void onInit() {
    // super.onInit();
    // for(int i=0;i<controller.albumNameList.length;i++){
    //   albumList?.add(controller.albumNameList[i].toString());
    //   selectAlbum = albumList![0];
    //   update();
    // }
    super.onInit();
     // albumList = albumNameList;
    albumList= ['Album1', 'Album2', 'Album3', 'Album4'];

    // selectAlbum = albumNameList[0].albumName;
    selectAlbum ='Album1';
    update();
  }
  HomeView? _homeView;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  getImage(File? imagefilevalue) {
    imageFile = imagefilevalue;
    update();
  }

  Future UploadSongData(
      String singerName, String songName, var urlDownload) async {
    firebase_storage.Reference ref =
        firebase_storage.FirebaseStorage.instance.ref('$singerName.musicApp');

    firebase_storage.UploadTask uploadTask = ref.putFile(imageFile!.absolute);
    await Future.value(uploadTask);
    String newUrl = ref.getDownloadURL().toString();
    creatSongCollection(singerName, songName, newUrl, urlDownload);
  }

  void creatSongCollection(
      String singerName, String songName, String newUrl, var songUrl) async {
    CollectionReference reference =
        (await FirebaseFirestore.instance.collection("SongAlbum").add({
      "singerName": singerName,
      "songName": songName,
      "newUrl": newUrl,
      "songUrl": songUrl,
    })) as CollectionReference<Object?>;
  }

  void getAlbumName(String albumName, String image) async {
    CollectionReference reference =
        (await FirebaseFirestore.instance.collection("Album").add({
      "image": image,
      "albumName": albumName,
    })) as CollectionReference<Object?>;

    Map<String, String> Album = {
      "image": image,
      "albumName": albumName,
    };
  }

  Future<void> getSonge() async {
    QuerySnapshot querySnapshot = FirebaseFirestore.instance
        .collection('Album')
        .get() as QuerySnapshot<Object?>;
    querySnapshot.docs.forEach((element) {
      albumNameType = AlbumNameType(
          // albumImage: element['image'],
          albumName: element['image'],
          albumImage: element['albumName']);

      // print(burgerModel.name);
      newAlbumNameList.add(albumNameType);
      // burgerList=newBurgerList;
      albumNameList = newAlbumNameList;
    });
    update();
  }

  get throwSongList {
    return albumNameList;
  }
}

class AlbumNameType {
  final String albumImage;
  final String albumName;
  AlbumNameType({
    required this.albumImage,
    required this.albumName,
  });
}

class FirebaseApi {
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }

  static UploadTask? uploadBytes(String destination, Uint8List data) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putData(data);
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
