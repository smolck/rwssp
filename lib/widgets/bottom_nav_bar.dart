import 'package:flutter/material.dart';
import 'package:rwssp/styles.dart';
import 'package:rwssp/models/page_model.dart' show AppPage;

Container bottomNavBar(BuildContext context,
    {@required int currentIndex, @required Function(AppPage) onTapHandler}) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(
          style: BorderStyle.solid,
          color: palette['black'],
        ),
      ),
    ),
    child: BottomNavigationBar(
      currentIndex: currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            // color: currentPage == AppPage.Home ? palette['red'] : Colors.black,
          ),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_border,
            // color: currentPage == AppPage.Favorites
                // ? palette['red']
                // : Colors.black,
          ),
          title: Text('Favorites'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            // color:
                // currentPage == AppPage.Settings ? palette['red'] : Colors.black,
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
