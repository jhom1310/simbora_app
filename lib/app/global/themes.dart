import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    backgroundColor: Colors.grey[350],
    //cardColor: Colors.grey[350],
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
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actionsIconTheme: IconThemeData(color: Colors.black)),
  );

  final darkTheme = ThemeData.dark().copyWith(
    backgroundColor: Colors.grey[350],
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
        borderSide: BorderSide(color: Colors.white),
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
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.yellow[700],
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      actionsIconTheme: IconThemeData(color: Colors.black),
    ),
  );
}
