import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  fontFamily: 'Poppins',
);

final kLabelStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins',
);
final gLabelStyle = TextStyle(
  color: Colors.grey,
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins',
  decoration: TextDecoration.underline,
);
final g2LabelStyle = TextStyle(
  color: Colors.grey,
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFFF7F8F8),
  borderRadius: BorderRadius.circular(15.0),
);

final gradientYellowToOrange = LinearGradient(
  begin: Alignment.centerRight,
  end: Alignment.centerLeft,
  colors: [
    Color(0xfffd7d06),
    Color(0xfffeb105),
    Color(0xfffdff02),
  ],
);
