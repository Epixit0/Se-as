import 'dart:math';

import 'package:first_app/screens/Leccion1.dart';
import 'package:flutter/material.dart';

class Levels extends StatefulWidget {
  const Levels({super.key});

  @override
  State<Levels> createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 105, 155),
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1.7,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  'images/Vnzla.png',
                  height: 30,
                ),
                appBarItem('images/offFire.png', '0', Colors.grey),
                appBarItem('images/crown.png', '0', Colors.grey),
              ],
            )),
        body: Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            ListView(children: <Widget>[
              const SizedBox(
                height: 15,
              ),
              twoLessons(
                  lesson(
                      'images/vocales.png', '1', 'Leccion 1', Colors.green, 1),
                  lesson(
                      'images/vocales.png', '0', 'Leccion 2', Colors.red, 2)),
              const SizedBox(height: 40),
              lesson('images/vocales.png', '4', 'Evaluacion 1&2',
                  Colors.lightBlue, 1),
              const SizedBox(
                height: 15,
              ),
              twoLessons(
                  lesson(
                      'images/numeros.png', '3', 'Leccion 3', Colors.orange, 3),
                  lesson(
                      'images/numeros.png', '1', 'Leccion 4', Colors.teal, 4)),
              const SizedBox(height: 40),
              lesson('images/vocales.png', '0', 'Evaluacion 3&4',
                  Colors.lightBlue, 1),
            ]),
          ],
        ));
  }

  Widget appBarItem(String image, String num, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(
          image,
          height: 30,
        ),
        Text(
          num,
          style: TextStyle(color: color, fontSize: 16),
        ),
      ],
    );
  }

  Widget lesson(
      String image, String number, String title, Color color, int lesson) {
    return InkWell(
      onTap: () {
        if (lesson == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FirstRoute()));
        }
        if (lesson == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SecondRoute()));
        }
        if (lesson == 3) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ThirdRoute()));
        }
        if (lesson == 4) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FourthRoute()));
        }
        if (lesson == 5) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FithRoute()));
        }
      },
      child: Column(children: <Widget>[
        Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            Stack(alignment: Alignment.center, children: <Widget>[
              Transform.rotate(
                angle: 3 * pi / 4,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[300],
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Colors.yellow),
                  value: double.parse(number) / 5,
                  strokeWidth: 60,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 42,
                ),
              ),
              CircleAvatar(
                radius: 35,
                backgroundColor: color,
                child: Image.asset(
                  image,
                  height: 50,
                ),
              )
            ]),
            Stack(alignment: Alignment.center, children: <Widget>[
              Image.asset(
                'images/crown.png',
                height: 30,
              ),
              Text(
                number,
                style: const TextStyle(color: Colors.deepOrangeAccent),
              ),
            ]),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        )
      ]),
    );
  }

  Widget twoLessons(Widget lesson1, Widget lesson2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        lesson1,
        const SizedBox(
          width: 20,
        ),
        lesson2
      ],
    );
  }
}
