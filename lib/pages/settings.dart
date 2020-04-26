import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

import '../styles.dart';
import './info.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      // TODO: Fix padding?
      child: Padding(
        padding: EdgeInsets.only(left: 24.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoPage(),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Icon(
                      OMIcons.info,
                      size: 40.0,
                      color: palette['red'],
                    ),
                  ),
                  Text(
                    'What exactly is R-W-S-S-P?',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24.0,
                      color: palette['red'],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        bottomLeft: Radius.circular(40.0),
                      ),
                      color: palette['red'].withAlpha(30),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.favorite,
                        color: palette['red'],
                        size: 15.0,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Favorites',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24.0,
                      color: palette['grey']), // TODO: Use 7F7F7F?
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
