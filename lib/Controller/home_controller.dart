import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../Model/AlbumModel.dart';

class HomeController extends GetxController {
  List<AlbumCategory> albumCategoryList1 = [];
  List<AlbumCategory> newAlbumCategoryList1 = [];
  late final AlbumCategory _albumCategory1;

  Future<void> getAlbumdata1() async {
    QuerySnapshot _querySnapshot1 = await FirebaseFirestore.instance
        .collection('Album')
        .doc('Q1RZ6uffWDnlOAfPgNqs')
        .collection('Album1')
        .get();
    for (var e in _querySnapshot1.docs) {
      _albumCategory1 =
          AlbumCategory(albumImage: e['image'], albumName: e['albumName']);
      newAlbumCategoryList1.add(_albumCategory1);
      albumCategoryList1 = newAlbumCategoryList1;
    }

    update();
  }

  get throwAlbumList1 {
    return albumCategoryList1;
  }

  List<AlbumCategory> albumCategoryList2 = [];
  List<AlbumCategory> newAlbumCategoryList2 = [];
  late final AlbumCategory _albumCategory2;

  Future<void> getAlbumdata2() async {
    QuerySnapshot _querySnapshot2 = await FirebaseFirestore.instance
        .collection('Album')
        .doc('Q1RZ6uffWDnlOAfPgNqs')
        .collection('Album2')
        .get();
    for (var e in _querySnapshot2.docs) {
      _albumCategory2 =
          AlbumCategory(albumImage: e['image'], albumName: e['albumName']);
      newAlbumCategoryList2.add(_albumCategory2);
      albumCategoryList2 = newAlbumCategoryList2;
    }

    update();
  }

  get throwAlbumList2 {
    return albumCategoryList2;
  }

  List<AlbumCategory> albumCategoryList3 = [];
  List<AlbumCategory> newAlbumCategoryList3 = [];
  late final AlbumCategory _albumCategory3;

  Future<void> getAlbumdata3() async {
    QuerySnapshot _querySnapshot3 = await FirebaseFirestore.instance
        .collection('Album')
        .doc('Q1RZ6uffWDnlOAfPgNqs')
        .collection('Album3')
        .get();
    for (var e in _querySnapshot3.docs) {
      _albumCategory3 =
          AlbumCategory(albumImage: e['image'], albumName: e['albumName']);
      newAlbumCategoryList3.add(_albumCategory3);
      albumCategoryList3 = newAlbumCategoryList3;
    }

    update();
  }

  get throwAlbumList3 {
    return albumCategoryList3;
  }

  int index = 0;

  updateIndex(int i) {
    index = i;
    update();
  }
}
