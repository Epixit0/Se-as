import 'package:first_app/screens/evaluations/evaluation_widget.dart';
import 'package:flutter/material.dart';

class EvaluationScreen extends StatefulWidget {
  static String routeName = "/evaluations";

  const EvaluationScreen({super.key});
  @override
  State<EvaluationScreen> createState() => _EvaluationScreenState();
}

class _EvaluationScreenState extends State<EvaluationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            EvaluationWidget(
                'Evaluacion 1', 'Las Vocales', 'images/vocales.png', true),
            EvaluationWidget(
                'Evaluacion 2', 'El Abcdario', 'images/abc.png', false),
            EvaluationWidget(
                'Evaluacion 3', 'Los Colores', 'images/colores.png', false),
            EvaluationWidget(
                'Evaluacion 4', 'Las Numeros', 'images/numeros.png', false),
            EvaluationWidget('Evaluacion 5', 'Las Dias de la Semana',
                'images/dias.png', false),
            EvaluationWidget(
                'Evaluacion 6', 'Los Meses del Año', 'images/meses.png', false),
          ],
        ),
      )),
    );
  }
}
