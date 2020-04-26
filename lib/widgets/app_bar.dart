import 'package:flutter/material.dart';
import 'package:rwssp/models/page_model.dart';
import 'package:provider/provider.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

import '../styles.dart';

PreferredSize _settingsPageAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size(double.infinity, 220),
    child: Column(
      children: <Widget>[
        // "Settings" widget
        Padding(
          padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Icon(
                      OMIcons.settings,
                      size: 50,
                    ),
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 38),
                  ),
                ],
              ),
            ),
          ),
        ),

        // TODO: Verify colors are consistent with everything and all that.
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // ESV Container
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    bottomLeft: Radius.circular(24.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 34.0, top: 10.0, bottom: 10.0, right: 34.0),
                  child: Text(
                    "ESV",
                    // TODO: Style
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 26,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),

              // NIV Container
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 34.0, right: 34.0),
                  child: Text(
                    "NIV",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 26,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),

              // KJV Container
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24.0),
                    bottomRight: Radius.circular(24.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 10.0, right: 34.0, left: 34.0),
                  child: Text(
                    "KJV",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 26,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Consumer<PageModel>(
              builder: (context, pageModel, _) => IconButton(
                onPressed: () => pageModel.setCurrentPage(AppPage.Home),
                icon: Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: palette['black'],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

// TODO
/* PreferredSize _infoPageAppBar(BuildContext context) {
  return PreferredSize(
      preferredSize: Size(double.infinity, 100),
      child: Container(
      ),
  );
} */

PreferredSize appBar(BuildContext context, {List<TextSpan> text}) {
  var currentPage = Provider.of<PageModel>(context, listen: false).currentPage;

  if (currentPage == AppPage.Settings) {
    return _settingsPageAppBar(context);
  }

  return PreferredSize(
    preferredSize: Size(double.infinity, 110),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 110,
      child: Padding(
        // TODO: Make this responsive.
        padding: EdgeInsets.fromLTRB(10, 40, 0, 0),
        child: RichText(
          text: TextSpan(
            children: text ??
                <TextSpan>[
                  TextSpan(text: 'Read it. ', style: appBarTextStyle),
                  TextSpan(text: 'Write it. ', style: appBarTextStyle),
                  TextSpan(text: 'Sing it. ', style: appBarTextStyle),
                  TextSpan(text: 'Say it. ', style: appBarTextStyle),
                  TextSpan(text: 'Pray it.', style: appBarTextStyle),
                ],
          ),
        ),
      ),
    ),
  );
}
