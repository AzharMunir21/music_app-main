import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: non_constant_identifier_names
Widget MyTextField(String hint, Icon icon, TextEditingController controler) {
  return Container(
    // height: 60 ,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: TextField(
        controller: controler,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          hintText: hint,
          prefixIcon: icon,
          border: InputBorder.none,
        ),
        style:
            GoogleFonts.josefinSans(fontSize: 14, fontWeight: FontWeight.w800),
      ),
    ),
  );
}
