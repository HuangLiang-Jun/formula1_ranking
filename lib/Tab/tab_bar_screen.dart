import 'package:flutter/material.dart';
import 'package:formula1_ranking/features/race_result/race_result_page.dart';
import 'package:formula1_ranking/features/teams/teams_page.dart';
import 'package:formula1_ranking/features/racers/racer_page.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    RacerPage(),
    TeamsPage(),
    RaceResultPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('F1 排名'),
        titleTextStyle: TextStyle(
          color: Colors.white
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0F172A),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.sports_motorsports), label: '車手'),
          BottomNavigationBarItem(icon: Icon(Icons.garage), label: '車隊'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: '賽事')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[800],
        unselectedItemColor: Colors.white70,
        onTap: _onItemTapped,
      ),
    );
  }
}