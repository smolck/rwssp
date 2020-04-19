import 'package:flutter/material.dart';
import '../widgets/widgets.dart' show appBar;
import '../styles.dart' show appBarTextStyle, infoPageHeader;

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        text: <TextSpan>[
          TextSpan(
            text:
                'What Exactly is "Read it. Write it. Sing it. Say it. Pray it."?', // TODO
            style: appBarTextStyle,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Center(
                child: Text(
              '"Read It."',
              style: infoPageHeader,
            )),
          ],
        ),
      ),
    );
  }
}
