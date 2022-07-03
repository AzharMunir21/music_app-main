

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AlbumDetailController extends GetxController {
  bool searching=false;
  TextEditingController searchController=TextEditingController();

  updateSearch(bool value) {
    searching=value;
    update();
  }
}