import 'package:first_app/lesson_screen/components/bottom_button.dart';
import 'package:first_app/lesson_screen/components/drag_lesson.dart';
import 'package:first_app/lesson_screen/components/grid_lesson.dart';
import 'package:first_app/lesson_screen/components/lesson_app_bar.dart';
import 'package:first_app/lesson_screen/components/list_lesson.dart';
import 'package:flutter/material.dart';
import 'package:first_app/lesson_screen/components/quiz_lesson.dart';

class LessonScreen extends StatefulWidget {
  static int answers = 0;
  const LessonScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LessonScreenState();
  }
}

class LessonScreenState extends State<LessonScreen> {
  double percent = 10.0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var lessons = [
      QuizLesson('images/u.png', 'E', 'A', 'U', 'I', 'U',
          checkButton: bottomButton(context, 'SIGUIENTE')),
      GridLesson(
        'Letra A',
        'images/E.png',
        'images/A.png',
        'images/o.png',
        'images/i.png',
        'images/A.png',
        checkButton: bottomButton(context, 'SIGUIENTE'),
      ),
      ListLesson(
          'Traduce la siguiente seña',
          const ['Hola', 'Buenas Noches', 'Adios', 'Buenas Tardes'],
          'images/hello.gif',
          'Hola',
          checkButton: bottomButton(context, 'SIGUIENTE')),
      GridLesson(
        'Letra O',
        'images/o.png',
        'images/E.png',
        'images/A.png',
        'images/i.png',
        'images/o.png',
        checkButton: bottomButton(context, 'SIGUIENTE'),
      ),
      QuizLesson('images/i.png', 'E', 'A', 'U', 'I', 'I',
          checkButton: bottomButton(context, 'SIGUIENTE')),
      DragLesson(
          'images/hello.gif',
          ['Hola', 'Permiso', 'Gracias', 'Por favor', 'Adios', 'Hasta'],
          ['Hola'],
          checkButton: bottomButton(context, 'SIGUIENTE')),
      ListLesson(
          'Traduce la siguiente seña',
          const ['Buenas Noches.', 'Gracias', 'Por favor', 'Adios'],
          'images/hello.gif',
          'Adios',
          checkButton: bottomButton(context, 'SIGUIENTE')),
      GridLesson(
        'Letra U',
        'images/u.png',
        'images/o.png',
        'images/i.png',
        'images/E.png',
        'images/u.png',
        checkButton: bottomButton(context, 'SIGUIENTE'),
      ),
      ListLesson(
          'Traduce la siguiente seña',
          const ["Permiso", 'Buenos dias', 'Adios', 'Hola'],
          'images/hello.gif',
          'Hola',
          checkButton: bottomButton(context, 'SIGUIENTE')),
      QuizLesson('images/o.png', 'O', 'I', 'A', 'E', 'O',
          checkButton: bottomButton(context, 'SIGUIENTE')),
    ];

    return Scaffold(
      appBar: LessonAppBar(percent: percent),
      body: lessons[index],
    );
  }

  bottomButton(BuildContext context, String title) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              if (percent <= 99) {
                percent += 10;
                index++;
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return dialog('Resultado ${LessonScreen.answers} /10 ');
                  },
                );
              }
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 0, 105, 155),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  dialog(String title) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 120,
        width: double.infinity,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            dialogTitle(title),
            BottomButton(context, title: 'CONTINUE'),
          ],
        ),
      ),
    );
  }

  dialogTitle(String text) {
    LessonScreen.answers = 0;
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(left: 15),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 27, 97, 129),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
