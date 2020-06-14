import 'package:flutter/material.dart';

const palette = {
  'red': const Color(0xFF9A1B1F),
  'grey': const Color(0xFF707070),
  'lighter_grey': const Color(0xFF7F7F7F),
  'black': const Color(0xFF313131),
};

TextStyle infoPageHeader({@required Color color}) => TextStyle(
  color: color,
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

TextStyle verseCardTitle({@required Color color}) => TextStyle(
  color: color,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Montserrat',
);

TextStyle verseCardVerse = TextStyle(
  color: palette['grey'],
  fontSize: 18.0,
  fontWeight: FontWeight.w300,
  fontStyle: FontStyle.italic,
  fontFamily: 'Montserrat',
);
