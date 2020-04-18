import 'package:flutter/material.dart';
import '../styles.dart';

PreferredSize appBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size(double.infinity, 110),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 110,
      child: Padding(
        // TODO: Make this responsive.
        padding: EdgeInsets.fromLTRB(10, 40, 0, 0),
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(text: 'Read it. ', style: appBarTextStyle),
              TextSpan(text: 'Write it. ', style: appBarTextStyle),
              TextSpan(text: 'Sing it. ', style: appBarTextStyle),
              TextSpan(text: 'Say it. ', style: appBarTextStyle),
              TextSpan(text: 'Pray it.', style: appBarTextStyle),
            ],
          ),
        ),
      ),
    ),
  );
}
