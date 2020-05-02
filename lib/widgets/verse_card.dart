import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../styles.dart';

// TODO: Stateful widget?
class VerseCard extends StatelessWidget {
  final String _header;
  final String _text;
  final String _reference;

  const VerseCard({
    @required String header,
    @required String text,
    @required String reference,
  })  : _header = header,
        _text = text,
        _reference = reference;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 8.0),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Powered by ',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 9,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'YouVersion',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 9,
                            color: palette['red'],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
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
                                topLeft: Radius.circular(40.0),
                                bottomLeft: Radius.circular(40.0),
                              ),
                              shape: BoxShape.rectangle,
                              color: Colors.grey.withAlpha(80),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.grey,
                              ),
                              onPressed: () => print('pressed fav'), // TODO
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50.0, right: 50.0),
                      child: Center(
                        child: Text(
                          _text,
                          style: verseCardVerse,
                        ),
                      ),
                    ),
                    Spacer(),
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
                              borderRadius: BorderRadius.circular(20)),
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
