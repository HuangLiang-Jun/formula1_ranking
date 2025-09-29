import 'package:flutter/material.dart';
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
    RacerPage(), // Bloc 已經在上層提供
    TeamsPage(),
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
        title: const Text('F1 Ranking'),
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
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: 'Driver'),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: 'Team'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[800],
        unselectedItemColor: Colors.white70,
        onTap: _onItemTapped,
      ),
    );
  }
}