import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    titleTextStyle: GoogleFonts.lato(
      fontSize: 22,
      textStyle: const TextStyle(color: Colors.white),
      fontWeight: FontWeight.w400,
    ),
    backgroundColor: Colors.transparent,
    actionsIconTheme: const IconThemeData(color: Colors.white),
  ),
  scaffoldBackgroundColor: const Color(0xFF363636),
  useMaterial3: true,
  textTheme: GoogleFonts.latoTextTheme().apply(
    bodyColor: Colors.white,
  ),
);
