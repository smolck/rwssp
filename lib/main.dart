import 'package:flutter/material.dart';
import 'package:rwssp/widgets/app_bar.dart';
import 'package:provider/provider.dart';
import 'package:rwssp/models/page_model.dart';

import './pages/home.dart';
import './pages/settings.dart';
import './pages/info.dart';
import './widgets/widgets.dart';
import './verse.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PageModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RWSSP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'RWSSP Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  Future<Verse> _verseOfDay = fetchVerseOfDay();

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageModel>(
      builder: (context, pageModel, _) {
        Widget page = HomePage(widget._verseOfDay);
        var currentIndex = 0;
        switch (pageModel.currentPage) {
          case AppPage.Settings:
            page = SettingsPage();
            currentIndex = 2;
            break;
          case AppPage.Info:
            page = InfoPage();
            currentIndex = 2;
            break;
          default:
            break;
          // TODO: Favorites page.
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar(context),
          body: page,
          bottomNavigationBar: bottomNavBar(
            context,
            currentIndex: currentIndex,
            onTapHandler: (page) {
              pageModel.setCurrentPage(page);
            },
          ),
        );
      },
    );
  }
}
