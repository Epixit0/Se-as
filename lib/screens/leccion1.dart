import 'package:flutter/material.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 105, 155),
        appBar: AppBar(
          title: const Text('Leccion 1'),
          centerTitle: true,
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          childAspectRatio: .8,
          children: <Widget>[
            elevatedCardExample('images/A.png'),
            elevatedCardExample('images/u.png'),
            elevatedCardExample('images/o.png'),
            elevatedCardExample('images/i.png'),
          ],
        ));
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 105, 155),
      appBar: AppBar(
        title: const Text('Leccion 2'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 105, 155),
      appBar: AppBar(
        title: const Text('Leccion 3'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class FourthRoute extends StatelessWidget {
  const FourthRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 105, 155),
      appBar: AppBar(
        title: const Text('Leccion 4'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class FithRoute extends StatelessWidget {
  const FithRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 105, 155),
      appBar: AppBar(
        title: const Text('Leccion 5'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

@override
Widget elevatedCardExample(String image) {
  return Center(
    child: Card(
      color: Colors.white,
      child: SizedBox(
        width: 150,
        height: 300,
        child: Center(child: Image.asset(image)),
      ),
    ),
  );
}
