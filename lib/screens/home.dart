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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          navBarItem('images/level.png', 'images/level2.png', 'Nivel'),
          navBarItem('images/book.png', 'images/book2.png', 'Lecciones'),
          navBarItem('images/person.png', 'images/person2.png', 'Perfil'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: const Levels(),
    );
  }

  BottomNavigationBarItem navBarItem(
      String image, String activeimage, String label) {
    return BottomNavigationBarItem(
        icon: Image.asset(
          image,
          height: 30,
        ),
        label: label,
        activeIcon: Image.asset(activeimage));
  }
}
