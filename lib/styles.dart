import 'package:flutter/material.dart';

const palette = {
  'red': const Color(0xFF9A1B1F),
  'grey': const Color(0xFF707070),
  'lighter_grey': const Color(0xFF7F7F7F),
  'black': const Color(0xFF484848),
};

TextStyle infoPageHeader = TextStyle(
  color: palette['red'],
  fontSize: 24.0,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.bold,
);

TextStyle infoPageText = TextStyle(
  color: palette['grey'],
  fontSize: 18.0,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w300,
);

TextStyle appBarTextStyle = TextStyle(
  color: palette['black'],
  fontSize: 29.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Roboto',
);

TextStyle selectedAppBarTextStyle = TextStyle(
  color: palette['red'],
  fontSize: 29.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Roboto',
);

TextStyle verseCardTitle = TextStyle(
  color: palette['red'],
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Roboto',
);

TextStyle verseCardVerse = TextStyle(
  color: palette['grey'],
  fontSize: 18.0,
  fontWeight: FontWeight.w300,
  fontStyle: FontStyle.italic,
  fontFamily: 'Montserrat',
);
