import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

snackBar(
  String title,
  String subtitle,
  Icon icon,
) {
  Get.snackbar(title, subtitle,
      titleText: Text(
        title,
        style: GoogleFonts.josefinSans(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.w800),
      ),
      messageText: Text(
        subtitle,
        style: GoogleFonts.josefinSans(
            fontSize: 12, color: Colors.white, fontWeight: FontWeight.w600),
      ),
      backgroundColor: Colors.red,
      animationDuration: const Duration(seconds: 3),
      icon: icon,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10));
}
