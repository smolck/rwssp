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
        padding: EdgeInsets.all(8.0),
        child: Container(
          // TODO(smolck): Maybe bigger dimensions here?
          width: 36.0,
          height: 36.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: const Color(0xFFBEBEBE),
              width: 0.5,
            ),
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
                      color: snapshot.data
                          ? Theme.of(context).primaryColor
                          : palette['grey'],
                    ),
                    iconSize: 15.0,
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
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          Padding(
            padding: EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
            child: Card(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22)),
              color: const Color(0xFFF9F9F9),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 13.0, top: 24.0),
                      child: Text(
                        _reference,
                        style: verseCardTitle(
                            color: Theme.of(context).primaryColor),
                      ),
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
                        child: Row(
                          children: <Widget>[
                            _favoriteButton(),
                            ButtonTheme(
                              height: 36.0,
                              minWidth: 213.0,
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
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
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
