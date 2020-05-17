import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';

import '../styles.dart';
import '../favorite.dart';
import '../database.dart';

// TODO: Stateful widget?
class VerseCard extends StatelessWidget {
  final String _header;
  final String _text;
  final String _reference;
  final bool _showStartButton;

  const VerseCard({
    bool showStartButton = false,
    String header,
    @required String text,
    @required String reference,
  })  : _header = header,
        _text = text,
        _reference = reference,
        _showStartButton = showStartButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          if (_header != null)
            Stack(
              children: <Widget>[
                Center(
                  child: Text(
                    _header,
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 17),
                  ),
                ),
              ],
            ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                shape: BoxShape.rectangle,
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            width: 32.0,
                            height: 0.0), // TODO: Not 100% sure why this works.
                        Text(_reference, style: verseCardTitle),
                        Padding(
                          padding: EdgeInsets.only(top: 18.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24.0),
                                bottomLeft: Radius.circular(24.0),
                              ),
                              shape: BoxShape.rectangle,
                              color: Colors.grey.withAlpha(80),
                            ),
                            // TODO: Messy, and also the empty Container thing
                            // doesn't really work right.
                            child: Consumer<AppDB>(
                              builder: (context, db, _) => FutureBuilder<bool>(
                                future: (() async => (await db.query(
                                      'favorites',
                                      where: 'reference = ?',
                                      whereArgs: [_reference],
                                    ))
                                        .isNotEmpty)(),
                                builder:
                                    (context, AsyncSnapshot<bool> snapshot) {
                                  if (snapshot.hasData) {
                                    if (snapshot.data) {
                                      return IconButton(
                                        icon: Icon(Icons.favorite,
                                            color: palette['red']),
                                        onPressed: () => db.delete('favorites',
                                            where: 'reference = ?',
                                            whereArgs: [_reference]),
                                      );
                                      //TODO: Snackbar favorited message?
                                    } else {
                                      return IconButton(
                                        icon: Icon(Icons.favorite,
                                            color: palette['grey']),
                                        onPressed: () => db.insert(
                                          'favorites',
                                          Favorite(_reference).toMap(),
                                        ),
                                      );
                                    }
                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    _showStartButton
                        ? Padding(
                            padding: EdgeInsets.only(left: 50.0, right: 50.0),
                            child: Center(
                              child: Text(
                                _text,
                                style: verseCardVerse,
                              ),
                            ),
                          )
                        // Make sure to pad the text on the bottom
                        // if the start button isn't there, since it would've
                        // added the padding.
                        : Padding(
                            padding: EdgeInsets.only(
                                left: 50.0, right: 50.0, bottom: 10.0),
                            child: Center(
                              child: Text(
                                _text,
                                style: verseCardVerse,
                              ),
                            ),
                          ),
                    // Spacer(),
                    if (_showStartButton)
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: RaisedButton(
                            child: Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Text(
                                'START',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    letterSpacing: 2.0),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            // TODO
                            onPressed: () => print('Pressed start button'),
                            color: palette['red'],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
