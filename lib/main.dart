import 'package:flutter/material.dart';
import 'package:rwssp/widgets/app_bar.dart';
import './pages/home.dart';
import './widgets/widgets.dart';

void main() {
  runApp(MyApp());
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

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context),
      body: HomePage(),
      bottomNavigationBar: bottomNavBar(
        context,
        currentPage: AppPage.Home,
        onTapHandler: (index) => {
          // TODO: Global state so I can see which page is the current one.
        },
      ),
    );
  }
}
