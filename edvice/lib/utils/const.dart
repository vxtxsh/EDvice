import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  // Name
  static String appName = "e-Learning";

  // Material Design Color
  static Color lightPrimary = Color(0xfffcfcff);
  static Color lightAccent = Color(0xFFF18C8E);
  static Color lightBackground = Color(0xfffcfcff);

  static Color grey = Color(0xff707070);
  static Color textPrimary = Color(0xFF486581);
  static Color textDark = Color.fromARGB(255, 33, 18, 36);

  // Salmon
  // static Color salmonMain = Color.fromARGB(255, 65, 10, 110);
  // static Color salmonDark = Color.fromARGB(255, 48, 3, 91);
  // static Color salmonLight = Color.fromARGB(255, 124, 67, 181);

  static Color salmonMain = Color(0xffb7d7c8);
  static Color salmonDark = Color(0xff423f3b);
  static Color salmonLight = Color(0xffced1cd);

  // Blue

  static Color blueMain = Color(0xFF579ACA);
  static Color blueDark = Color(0xFF4E92B1);
  static Color blueLight = Color(0xFF5AA6C8);

  // Pink
  static Color lightPink = Color(0xFF6A6C6D);

  // Yellow
  static Color lightYellow = Color(0xFFFFF5E5);

  // Violet
  static Color lightViolet = Color(0xFFFBF5FF);

  static ThemeData lighTheme(BuildContext context) {
    return ThemeData(
      backgroundColor: lightBackground,
      primaryColor: lightPrimary,
      hintColor: lightAccent,
      cardColor: lightAccent,
      scaffoldBackgroundColor: lightBackground,
      textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      appBarTheme: AppBarTheme(
        //textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        iconTheme: IconThemeData(
          color: lightAccent,
        ),
      ),
    );
  }

  static double headerHeight = 228.5;
  static double mainPadding = 20.0;
}
