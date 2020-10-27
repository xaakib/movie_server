import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:movie_server/screens/matches.dart';
import 'package:movie_server/screens/stats.dart';
import 'package:movie_server/screens/teams.dart';

import 'screens/pointstable.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NavigationPage(),
    );
  }
}

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  List<Widget> pageoptions = [
    MatchScreen(),
    PointsTable(),
    TeamScreen(),
    StartScreen(),
  ];
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        height: 50,
        items: [
          Icon(Icons.home, size: 32, color: Colors.black),
          Icon(Icons.person, size: 32, color: Colors.black),
          Icon(Icons.table_chart, size: 32, color: Colors.black),
          Icon(Icons.trending_up, size: 32, color: Colors.black),
        ],
      ),
      body: pageoptions[page],
    );
  }
}
