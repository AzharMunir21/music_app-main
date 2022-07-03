// ignore_for_file: avoid_print

import 'package:get/get.dart';

class SettingController extends GetxController {
  bool isDark = false;

  updateDarkMood(bool val) {
    isDark = val;
    update();
    print(val);
  }
}
