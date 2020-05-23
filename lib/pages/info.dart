import 'package:flutter/material.dart';

import '../styles.dart' show infoPageHeader, infoPageText;

// TODO(smolck): Make app bar's back arrow disappear on scroll.
class InfoPage extends StatelessWidget {
  static const _infoText = {
    'readIt': """
This is the first step; read the Scripture you want to memorize. We recommend 10 times, which while it may seem monotonous, it's quite helpful for memorization.
    """,
    'writeIt': """
As the second step, it's as simple as it sounds. You write the verse (recommended 10 times) to further solidify the Scripture verse in your mind.
    """,
    'singIt': """
Here, you sing the verse. It doesn't have to be with an elaborate song, nor does it have to be set to music. 
Nope; just sing it to the Lord however many times you wish, although doing so at least twice will be helpful for memorization.
    """,
    'sayIt': """
Once again, this is a simple part of the memorization process.
Just read the verse aloud to yourself 10 times, or less/more depending on what works for you.
    """,
    'prayIt': """
Lastly, pray the verse believing ONCE. The important part here is not so much to memorize the verse as
to truly pray it to the Lord. Yes, it will help with memorization, but this step is about
truly praying to the Lord what you've been reading. After you've done that, you've finished memorizing that verse!
You can choose another one to start memorizing or just be glad that you've internalized a Scripture verse!
    """
  };

  Padding _header(String text) => Padding(
        padding: EdgeInsets.only(bottom: 20.0, top: 35.0),
        child: Center(
          child: Text(text, style: infoPageHeader),
        ),
      );

  Center _description(String text) => Center(
        child: Padding(
          padding: EdgeInsets.only(left: 35.0, right: 35.0),
          child: RichText(
            text: TextSpan(text: text, style: infoPageText),
            textAlign: TextAlign.center,
          ),
        ),
      );

  Padding _card(String headerText, String infoText) => Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Card(
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
          child: Column(
            children: <Widget>[
              _header(headerText),
              _description(infoText),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowGlow();
            return false;
          },
          child: ListView(
            children: <Widget>[
              _card("R - Read It.", _infoText['readIt']),
              _card("W - Write It.", _infoText['writeIt']),
              _card("S - Sing It.", _infoText['singIt']),
              _card("S - Say It.", _infoText['sayIt']),
              _card("P - Pray It.", _infoText['prayIt']),
            ],
          ),
        ),
      ),
    );
  }
}
