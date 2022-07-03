import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget heading1(String text) {
  return Text(
    text,
    style: GoogleFonts.josefinSans(
      fontSize: 24,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    ),
  );
}

Widget heading4(String text) {
  return Text(
    text,
    style: GoogleFonts.josefinSans(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );
}

Widget redHeading(String text) {
  return Text(
    text,
    style: GoogleFonts.josefinSans(
      fontSize: 18,
      fontWeight: FontWeight.w900,
      color: const Color.fromARGB(255, 228, 27, 13),
    ),
  );
}

Widget redHeader(String text) {
  return Text(
    text,
    style: GoogleFonts.roboto(
      fontSize: 28,
      fontWeight: FontWeight.w900,
      color: Colors.white,
    ),
  );
}

Widget customText(String txt, Color color, double size) {
  return Text(
    txt,
    style: GoogleFonts.josefinSans(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: color,
    ),
  );
}
