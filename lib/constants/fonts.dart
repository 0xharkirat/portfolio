import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

const kAcornFonts = "Acorn";
const kGtFonts = "Gt";

final darkTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 96.0,
      fontWeight: FontWeight.bold,
      color: Colors.white70,
      fontFamily: kAcornFonts,
      // You can add more styling properties as needed
    ),
    titleMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: kTextColor,
      fontFamily: kGtFonts,
    ),
    bodyLarge: TextStyle(
      fontSize: 20,
      color: kTextColor,
      fontFamily: kGtFonts,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      color: kTextColor,
      fontFamily: kGtFonts,
    ),
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: Colors.white54,
      fontFamily: kGtFonts,
    )
  ),
);
