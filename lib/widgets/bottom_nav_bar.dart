import 'package:flutter/material.dart';
import '../styles.dart';

enum AppPage {
  Home,
  Favorites,
  Settings,
}

Container bottomNavBar(BuildContext context,
    {@required AppPage currentPage, @required Function(int) onTapHandler}) {
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
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: currentPage == AppPage.Home ? palette['red'] : Colors.black,
          ),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_border,
            color: currentPage == AppPage.Favorites
                ? palette['red']
                : Colors.black,
          ),
          title: Text('Favorites'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            color:
                currentPage == AppPage.Settings ? palette['red'] : Colors.black,
          ),
          title: Text('Settings'),
        ),
      ],
      onTap: onTapHandler,
      backgroundColor: Colors.white,
      selectedItemColor: palette['red'],
    ),
  );
}
