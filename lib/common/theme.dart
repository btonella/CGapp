import 'package:CulturaGame/utils/constants.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.yellow,
    brightness: Brightness.light,
    primaryColor: AppColors.yellow,
    accentColor: AppColors.grey,

    // Define the default font family.
    fontFamily: 'Montserrat',

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, fontFamily: 'ArcadePix', color: Colors.black),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic, color: Colors.black),
      bodyText1: TextStyle(fontSize: 12.0, color: Colors.black),
      bodyText2: TextStyle(fontSize: 14.0, color: Colors.black),
    ),
  );
}
