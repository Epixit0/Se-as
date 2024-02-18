// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:first_app/screens/levels.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        indicatorColor: Colors.blueAccent,
        selectedIndex: _currentIndex,
        destinations: <Widget>[
          navBarItem('images/level.png', 'images/level2.png', 'Nivel'),
          navBarItem('images/book.png', 'images/book2.png', 'Lecciones'),
          navBarItem('images/person.png', 'images/person2.png', 'Perfil'),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          const Levels(),
          const Center(
            child: Text(
              'Lecciones',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const Center(
            child: Text(
              'Perfil',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget navBarItem(String image, String activeimage, String label) {
    return NavigationDestination(
      icon: Image.asset(
        image,
        height: 30,
      ),
      label: label,
      selectedIcon: Image.asset(activeimage),
    );
  }
}
