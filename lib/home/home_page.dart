import 'package:flutter/material.dart';
import 'package:flutterproject/home/schedule_page.dart';
import 'package:flutterproject/home/timetable_page.dart';

import 'friends_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> controllers = [
    TimetablePage(),
    SchedulePage(),
    FriendsPage(),
  ];

  void _tabPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(child: controllers[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Timetable',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_new),
            label: 'Friends',
          )
        ],
        onTap: _tabPressed,
        currentIndex: _currentIndex,
      ),
    );
  }
}
