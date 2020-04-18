import 'package:flutter/material.dart';

const palette = {
  'pink': const Color(0xFFE67A7A),
  'grey': const Color(0xFF707070),
  'lighter_grey': const Color(0xFF7F7F7F),
  'black': const Color(0xFF484848),
};

TextStyle appBarTextStyle = TextStyle(
  color: palette['black'],
  fontSize: 29.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Roboto',
);

TextStyle selectedAppBarTextStyle = TextStyle(
  color: palette['pink'],
  fontSize: 29.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Roboto',
);

TextStyle verseCardTitle = TextStyle(
  color: palette['pink'],
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Roboto',
);

TextStyle verseCardVerse = TextStyle(
  color: palette['grey'],
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  fontFamily: 'Montserrat',
);
