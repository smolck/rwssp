import 'package:flutter/material.dart';
import 'package:rwssp/styles.dart';
import 'package:rwssp/models/page_model.dart' show AppPage;
import 'package:outline_material_icons/outline_material_icons.dart';


Container bottomNavBar(BuildContext context,
    {@required int currentIndex, @required Function(AppPage) onTapHandler}) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(
          style: BorderStyle.solid,
          color: palette['grey'],
        ),
      ),
    ),
    child: BottomNavigationBar(
      currentIndex: currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            OMIcons.home,
          ),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            OMIcons.favorite,
          ),
          title: Text('Favorites'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            OMIcons.settings,
          ),
          title: Text('Settings'),
        ),
      ],
      onTap: (index) {
        var page;
        switch (index) {
          case 0:
            page = AppPage.Home;
            break;
          case 1:
            page = AppPage.Favorites;
            break;
          case 2:
            page = AppPage.Settings;
            break;
        }
        onTapHandler(page);
      },
      backgroundColor: Colors.white,
      selectedItemColor: palette['red'],
      selectedLabelStyle: TextStyle(color: palette['red']),
    ),
  );
}
