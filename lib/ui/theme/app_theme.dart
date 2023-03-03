import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_app/const/app_color.dart';

class AppTheme {
  ThemeData lightTheme(context) => ThemeData(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black)),
      colorScheme: ColorScheme.light(),
      primarySwatch: Colors.blue,
      textTheme:
          GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme.apply()),
      scaffoldBackgroundColor: AppColor.scaffoldColor);
  ThemeData darkTheme(context) => ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white)),
      colorScheme: ColorScheme.dark(),
      primarySwatch: Colors.blue,
      textTheme:
          GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme.apply()),
      scaffoldBackgroundColor: Colors.black38);

  ThemeData previousX(context) => ThemeData(
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      primarySwatch: Colors.blue,
      textTheme:
          GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme.apply()),
      scaffoldBackgroundColor: AppColor.scaffoldColor);
}
