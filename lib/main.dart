import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rwssp/widgets/app_bar.dart';
import 'package:provider/provider.dart';
import 'package:rwssp/models/page_model.dart';

import './styles.dart';

import './pages/home.dart';
import './pages/settings.dart';
import './pages/info.dart';
import './pages/favorites.dart';

import './widgets/widgets.dart';
import './verse.dart';
import './database.dart';

void main() async {
  // TODO(smolck): Necessary? from https://itnext.io/how-to-use-flutter-with-sqlite-b6c75a5215c4
  WidgetsFlutterBinding.ensureInitialized();

  final db = await AppDB.initDb(version: 1);

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<PageModel>(
        create: (context) => PageModel(),
      ),
      ChangeNotifierProvider<AppDB>(
        create: (context) => db,
      )
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RWSSP',
      theme: ThemeData(
        primaryColor: const Color(0xFF148561),
        appBarTheme: AppBarTheme(color: palette['black'])
      ),
      home: MyHomePage(title: 'RWSSP Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final Future<Verse> _verseOfDay = fetchVerseOfDay();

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
          case AppPage.Favorites:
            page = FavoritesPage();
            currentIndex = 1;
            break;
          default:
            break;
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
