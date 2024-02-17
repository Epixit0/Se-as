import 'package:flutter/material.dart';
import 'package:first_app/widgets/scaffold_home.dart';

class RecuperarContrasena extends StatefulWidget {
  const RecuperarContrasena({super.key});

  @override
  State<RecuperarContrasena> createState() => _RecuperarContrasenaState();
}

class _RecuperarContrasenaState extends State<RecuperarContrasena> {
  @override
  Widget build(BuildContext context) {
    return const ScaffoldHome(
        image: 'assets/images/home.png', child: Text('Olvide Screen'));
  }
}
