import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    titleTextStyle: GoogleFonts.lato(
      fontSize: 22,
      textStyle: const TextStyle(color: Colors.black),
      fontWeight: FontWeight.w400,
    ),
  ),
  textTheme: GoogleFonts.latoTextTheme().apply(
    bodyColor: Colors.black,
  ),
  useMaterial3: true,
);
