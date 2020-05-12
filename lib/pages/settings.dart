import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:provider/provider.dart';

import '../models/page_model.dart';
import '../styles.dart';
import './info.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      // TODO: Fix padding?
      child: Padding(
        padding: EdgeInsets.only(left: 24.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Consumer<PageModel>(
                builder: (context, pageModel, _) {
                  return GestureDetector(
                    onTap: () => pageModel.setCurrentPage(AppPage.Info),
                    child: RichText(
                      softWrap: false,
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, right: 12.0),
                              child: Icon(
                                OMIcons.info,
                                size: 30.0,
                                color: palette['red'],
                              ),
                            ),
                          ),
                          TextSpan(
                            text: 'What exactly is RWSSP?',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 22.0,
                              color: palette['red'],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: EdgeInsets.only(left: 12.0, right: 12.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                bottomLeft: Radius.circular(40.0),
                              ),
                              color: palette['red'].withAlpha(30),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.favorite,
                                color: palette['red'],
                                size: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: 'Favorites',
                        style: TextStyle(
                          textBaseline: TextBaseline.alphabetic,
                            fontFamily: 'Montserrat',
                            fontSize: 22.0,
                            color: palette['grey']), // TODO: Use 7F7F7F?
                      ),
                      WidgetSpan(child: Spacer()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
