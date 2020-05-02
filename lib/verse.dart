import 'dart:convert' show jsonDecode;
import 'dart:io' show SocketException;

import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

class Verse {
  final String text;
  final String ref;

  const Verse(this.text, this.ref);
}

Future<Verse> fetchVerseOfDay() async {
  final devToken = jsonDecode(
    await rootBundle.loadString('assets/secrets.json'),
  )['youversion_dev_token'];

  final date = DateTime.now().day;

  try {
    final resp = await http.get(
      'https://developers.youversionapi.com/1.0/verse_of_the_day/$date?version_id=1', // TODO: Version id conf
      headers: {
        'accept': 'application/json',
        'x-youversion-developer-token': devToken,
      },
    );

    final json = jsonDecode(resp.body);
    return Verse(json['verse']['text'], json['verse']['human_reference']);
  } on SocketException {
    print("TODO");
  }
  
  return Verse('TODO', 'TODO'); // TODO
}