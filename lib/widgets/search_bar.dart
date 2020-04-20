import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rwssp/models/page_model.dart';
import '../styles.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          shape: BoxShape.rectangle,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Icon(Icons.search, color: Colors.grey, size: 30.0),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: 'Search for a verse to memorize',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                children: <Widget>[
                  VerticalDivider(
                    color: Colors.black,
                    thickness: 1.0,
                  ),
                  Consumer<PageModel>(
                    builder: (context, pageModel, _) => IconButton(
                      onPressed: () => pageModel.setCurrentPage(AppPage.Settings),
                      icon: Icon(Icons.settings),
                      color: palette['red'],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
