import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../styles.dart';
import '../favorite.dart';
import '../database.dart';

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

  Padding _favoriteButton() => Padding(
        padding: EdgeInsets.only(top: 18.0),
        child: Container(
          // TODO(smolck): Maybe bigger dimensions here?
          width: 34.0,
          height: 34.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              bottomLeft: Radius.circular(24.0),
            ),
            shape: BoxShape.rectangle,
            color: Colors.grey.withAlpha(80),
          ),
          child: Consumer<AppDB>(
            builder: (context, db, _) => FutureBuilder<bool>(
              future: (() async => (await db.query(
                    'favorites',
                    where: 'reference = ?',
                    whereArgs: [_reference],
                  ))
                      .isNotEmpty)(),
              builder: (context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.hasData) {
                  // TODO(Robotboy897): Snackbar favorited message?
                  return IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: snapshot.data ? palette['red'] : palette['grey'],
                    ),
                    iconSize: 17.0,
                    onPressed: snapshot.data
                        ? () => db.delete(
                              'favorites',
                              where: 'reference = ?',
                              whereArgs: [_reference],
                            )
                        : () => db.insert(
                              'favorites',
                              Favorite(_reference, _text).toMap(),
                            ),
                  );
                } else {
                  // TODO(smolck): Proper error handling.
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ),
      );

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
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22)),
              elevation: 3,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 32.0,
                          height: 0.0,
                        ),
                        // TODO(smolck): Not sure this is actually centered.
                        Text(_reference, style: verseCardTitle),
                        _favoriteButton(),
                      ],
                    ),
                    Padding(
                      padding: _showStartButton
                          ? EdgeInsets.only(left: 50.0, right: 50.0)
                          // Make sure to pad text on bottom if no start button.
                          : EdgeInsets.only(
                              left: 50.0, right: 50.0, bottom: 30.0),
                      child: Center(
                        child: Text(_text, style: verseCardVerse),
                      ),
                    ),
                    if (_showStartButton)
                      Padding(
                        padding: EdgeInsets.only(
                          right: 10.0,
                          bottom: 10.0,
                          top: 30.0,
                        ),
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
                                  letterSpacing: 2.0,
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            // TODO(smolck): Implement start functionality.
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
