import 'package:flutter/material.dart';
import 'package:rwssp/models/page_model.dart';
import 'package:provider/provider.dart';

import '../styles.dart';

PreferredSize _settingsPageAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size(double.infinity, 130),
    child: Padding(
      // TODO(smolck): Make this responsive.
      padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 130,
        child: Text(
          'Settings',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: palette['red'],
            fontSize: 29,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      ),
    ),
  );
}

PreferredSize _infoPageAppBar(BuildContext context) {
  final backButton = Padding(
    padding: EdgeInsets.only(left: 16.0, top: 10.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Consumer<PageModel>(
        builder: (context, pageModel, _) => IconButton(
          onPressed: () => pageModel.setCurrentPage(AppPage.Settings),
          icon: Icon(
            Icons.arrow_back,
            size: 24,
            color: palette['black'],
          ),
        ),
      ),
    ),
  );

  return PreferredSize(
    preferredSize: Size(double.infinity, 190),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 190,
      child: Column(
        children: <Widget>[
          Container(
            height: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                colorFilter: ColorFilter.mode(
                    Color.fromRGBO(154, 27, 31, 0.56), BlendMode.srcATop),
                image: AssetImage('assets/infopageimg.png'),
              ),
            ),
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: 'What exactly is\nRWSSP?',
                  style: appBarTextStyle.apply(color: Colors.white),
                ),
              ),
            ),
          ),
          backButton,
        ],
      ),
    ),
  );
}

PreferredSize _favoritesPageAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size(double.infinity, 110),
    child: Padding(
      // TODO(smolck): Make this responsive.
      padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 110,
        child: Text(
          'Favorites',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: palette['red'],
            fontSize: 29,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      ),
    ),
  );
}

PreferredSize appBar(BuildContext context, {List<TextSpan> text}) {
  var currentPage = Provider.of<PageModel>(context, listen: false).currentPage;

  switch (currentPage) {
    case AppPage.Settings:
      return _settingsPageAppBar(context);
    case AppPage.Info:
      return _infoPageAppBar(context);
    case AppPage.Favorites:
      return _favoritesPageAppBar(context);
    default:
      break;
  }

  return PreferredSize(
    preferredSize: Size(double.infinity, 110),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 110,
      child: Padding(
        // TODO(smolck): Make this responsive.
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
