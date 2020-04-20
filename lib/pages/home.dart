import 'dart:convert' show jsonDecode;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

import '../widgets/widgets.dart';

class _Verse {
  final String text;
  final String ref;

  const _Verse(this.text, this.ref);
}

Future<_Verse> fetchVerseOfDay() async {
  final devToken = jsonDecode(
    await rootBundle.loadString('assets/secrets.json'),
  )['youversion_dev_token'];

  final resp = await http.get(
    'https://developers.youversionapi.com/1.0/verse_of_the_day/1?version_id=1', // TODO: Version id conf
    headers: {
      'accept': 'application/json',
      'x-youversion-developer-token': devToken,
    },
  );

  final json = jsonDecode(resp.body);
  return _Verse(json['verse']['text'], json['verse']['human_reference']);
}

// TODO: Stateful widget?
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<_Verse>(
      future: fetchVerseOfDay(),
      builder: (BuildContext context, AsyncSnapshot<_Verse> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: <Widget>[
              SearchBar(),
              VerseCard(
                header: 'Verse of the Day', // TODO: "Powered by YouVersion"
                text: snapshot.data.text,
                reference: snapshot.data.ref,
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator()); // TODO
        }
      },
    );
  }
}
