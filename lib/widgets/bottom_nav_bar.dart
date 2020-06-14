import 'package:flutter/material.dart';
import 'package:rwssp/styles.dart';
import 'package:rwssp/models/page_model.dart' show AppPage;

// TODO(smolck): Transition when changing page. See https://flutter.dev/docs/cookbook/animation/page-route-animation.
Container bottomNavBar(BuildContext context,
    {@required int currentIndex, @required Function(AppPage) onTapHandler}) {
  return Container(
    child: BottomNavigationBar(
      currentIndex: currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          title: Text('Favorites'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
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
      selectedItemColor: Theme.of(context).primaryColor,
      selectedLabelStyle: TextStyle(color: palette['red']),
    ),
  );
}
