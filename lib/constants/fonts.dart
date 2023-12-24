import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

const kAcornFonts = "Acorn";
const kGtFonts = "Gt";

TextStyle headlineStyle = const TextStyle(
    fontSize: 96.0,
    fontWeight: FontWeight.bold,
    color: Colors.white70,
    fontFamily: kAcornFonts
    // You can add more styling properties as needed
    );

TextStyle headlineStyle2 = const TextStyle(
    fontSize: 48.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: kAcornFonts
    // You can add more styling properties as needed
    );

TextStyle subTitleStyle = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w400,
  color: kTextColor,
  fontFamily: kGtFonts,
);

TextStyle bodyTextStyle = const TextStyle(
  fontSize: 16,
  color: kTextColor,
  fontFamily: kGtFonts,
);



