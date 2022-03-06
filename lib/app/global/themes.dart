import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Color(0xffffCB05),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Color(0xffffCB05),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          Colors.black,
        ),
      ),
    ),
    indicatorColor: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffffCB05),
        ),
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Color(0xffffCB05),
    ),
  );

  final darkTheme = ThemeData.dark().copyWith(
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Color(0xffffCB05),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Color(0xffffCB05),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          Colors.black,
        ),
      ),
    ),
    indicatorColor: Color(0xffffCB05),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffffCB05),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.yellow[700],
    ),
  );
}
