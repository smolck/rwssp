import 'package:flutter/material.dart';
import '../styles.dart';
import 'package:rwssp/models/page_model.dart';
import 'package:provider/provider.dart';

PreferredSize _settingsPageAppBar(BuildContext context) {
  return PreferredSize(
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
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 38),
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
