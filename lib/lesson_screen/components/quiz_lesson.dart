import 'package:flutter/material.dart';
import 'package:first_app/lesson_screen/lesson_screen.dart';

class QuizLesson extends StatefulWidget {
  final Widget checkButton;
  final String imagen;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String correct;

  const QuizLesson(this.imagen, this.option1, this.option2, this.option3,
      this.option4, this.correct,
      {required this.checkButton, Key? key})
      : super(key: key);

  @override
  QuizLessonState createState() => QuizLessonState();
}

class QuizLessonState extends State<QuizLesson> {
  bool show = false;
  bool isactive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(
                        width: 5,
                        color: const Color.fromARGB(255, 27, 97, 129)),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    instruction('Select the correct answer'),
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 30),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(widget.imagen,
                              height: 250, width: 300, fit: BoxFit.fill),
                        )),
                    const SizedBox(height: 20),
                    GestureDetector(
                        onTap: () {
                          show = true;
                          setState(() {});
                          if (isactive) {
                            setState(() {
                              isactive = false;
                            });
                            if (widget.option1 == widget.correct) {
                              LessonScreen.answers++;
                            }
                          }
                        },
                        child: show
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: widget.correct == widget.option1
                                            ? Colors.green
                                            : Colors.red,
                                        width: 3),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(widget.option1,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.5),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(widget.option1,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)))),
                    const SizedBox(height: 20),
                    GestureDetector(
                        onTap: () {
                          show = true;
                          setState(() {});
                          if (isactive) {
                            setState(() {
                              isactive = false;
                            });
                            if (widget.option2 == widget.correct) {
                              LessonScreen.answers++;
                            }
                          }
                        },
                        child: show
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: widget.correct == widget.option2
                                            ? Colors.green
                                            : Colors.red,
                                        width: 3),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(widget.option2,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.5),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(widget.option2,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)))),
                    const SizedBox(height: 20),
                    GestureDetector(
                        onTap: () {
                          show = true;
                          setState(() {});
                          if (isactive) {
                            setState(() {
                              isactive = false;
                            });
                            if (widget.option3 == widget.correct) {
                              LessonScreen.answers++;
                            }
                          }
                        },
                        child: show
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: widget.correct == widget.option3
                                            ? Colors.green
                                            : Colors.red,
                                        width: 3),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(widget.option3,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.5),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(widget.option3,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)))),
                    const SizedBox(height: 20),
                    GestureDetector(
                        onTap: () {
                          show = true;
                          setState(() {});
                          if (isactive) {
                            setState(() {
                              isactive = false;
                            });
                            if (widget.option4 == widget.correct) {
                              LessonScreen.answers++;
                            }
                          }
                        },
                        child: show
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: widget.correct == widget.option4
                                            ? Colors.green
                                            : Colors.red,
                                        width: 3),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(widget.option4,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.5),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(widget.option4,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)))),
                    const SizedBox(height: 20),
                    widget.checkButton,
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

questionRow(String question) {
  return Container(
    margin: const EdgeInsets.only(left: 15, bottom: 5),
    child: Row(
      children: [
        speakButton(),
        const Padding(padding: EdgeInsets.only(right: 15)),
        Text(
          question,
          style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4B4B4B)),
        )
      ],
    ),
  );
}

speakButton() {
  return Container(
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: const Color(0xFF1CB0F6),
      borderRadius: BorderRadius.circular(10),
    ),
    child: const Icon(
      Icons.volume_up,
      color: Colors.white,
      size: 35,
    ),
  );
}

instruction(String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      padding: const EdgeInsets.only(top: 10, left: 15),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xFF4B4B4B),
        ),
      ),
    ),
  );
}
