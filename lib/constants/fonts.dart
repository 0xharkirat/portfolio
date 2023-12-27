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
  fontSize: 20,
  color: kTextColor,
  fontFamily: kGtFonts,
);

TextStyle descriptionTextStyle = const TextStyle(
  fontSize: 18,
  color: Colors.white,
  fontFamily: kGtFonts,
);


TextStyle titleTextStyle = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w900,
  color: Colors.white54,
  fontFamily: kGtFonts,
);




