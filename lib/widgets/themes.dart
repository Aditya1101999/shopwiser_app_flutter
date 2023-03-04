import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class myThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.pink,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
    canvasColor: creamColor,
    // ignore: deprecated_member_use
    buttonColor: darkBlue,
    // ignore: deprecated_member_use
    accentColor: Colors.pink,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Vx.gray700,
    canvasColor: darkCreamColor,
    // ignore: deprecated_member_use
    buttonColor: lightBlue,
    // ignore: deprecated_member_use
    accentColor: Colors.white,
      primarySwatch: Colors.pink,
      appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25)));
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Colors.black;
  static Color darkBlue = Color(0xff403b58);
  static Color lightBlue = Vx.pink600;
}
