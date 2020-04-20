import 'package:flutter/material.dart';

enum AppPage {
  Home,
  Favorites,
  Settings,
}

class PageModel extends ChangeNotifier {
  AppPage _currentPage;
  AppPage get currentPage => _currentPage;

  PageModel({AppPage currentPage}) : _currentPage = currentPage ?? AppPage.Home;

  void setCurrentPage(AppPage page) {
    _currentPage = page;

    notifyListeners();
  }
}
