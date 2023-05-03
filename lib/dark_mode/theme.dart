import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// the class Theme defines the theme dark mode and light mode of the app, ive also saved some fonts here that use on the input form
class Themes {
  static final light = ThemeData(
  brightness: Brightness.light,
  );

  static final dark = ThemeData(
  brightness: Brightness.dark,
  );
}
// the code below sets up google fonts that are used in the input form
TextStyle get subHeadingStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    ),

  );
}

TextStyle get headingStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),

  );
}

TextStyle get titleStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),

  );
}

TextStyle get subTitleStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),

  );
}