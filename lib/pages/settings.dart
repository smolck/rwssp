import 'package:flutter/material.dart';
import '../styles.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Padding stuff is ugly.
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 200),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  shape: BoxShape.rectangle,
                ),
                width: MediaQuery.of(context).size.width,
                height: 120,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.settings,
                          size: 50,
                        ),
                      ),
                      Text(
                        'Settings',
                        style:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 38),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: palette['black'],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 24.0),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () => print(
                    'Tapped info on RWSSP'), // TODO: Navigate to Info page.
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.info_outline,
                        size: 40.0,
                        color: palette['pink'],
                      ),
                    ),
                    Text(
                      'Information on R-W-S-S-P',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 24.0,
                        color: palette['pink'],
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
                        color: palette['pink'].withAlpha(30),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.favorite,
                          color: palette['pink'],
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
      ),
    );
  }
}
