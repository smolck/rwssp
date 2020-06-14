import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../verse.dart';

class HomePage extends StatelessWidget {
  final Future<Verse> _verseOfDay;

  const HomePage(this._verseOfDay);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Verse>(
      future: _verseOfDay,
      builder: (BuildContext context, AsyncSnapshot<Verse> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 24.0), child: SearchBar()),
              VerseCard(
                header: 'Verse of the Day',
                text: snapshot.data.text,
                reference: snapshot.data.ref,
                showStartButton: true,
              ),
            ],
          );
        } else {
          // TODO(smolck): Error handling, don't just show a forever loading spinner.
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
