import 'package:flutter/material.dart';
import 'package:first_app/screens/login.dart';
import 'package:first_app/screens/registro.dart';
import 'package:first_app/widgets/button.dart';
import 'package:first_app/widgets/scaffold_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldHome(
      image: 'images/home.png',
      child: Column(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 40.0,
                ),
                child: Center(
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(children: [
                          TextSpan(
                              text: 'Bienvenido\n',
                              style: TextStyle(
                                  fontSize: 45.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                          TextSpan(
                              text:
                                  '\nAprende lenguaje de señas de una manera facil e intuitiva',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black))
                        ]))),
              )),
          const Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Button(
                      buttonText: 'Iniciar Sesion',
                      onTap: LoginScreen(),
                    ),
                    SizedBox(height: 10),
                    Button(
                      buttonText: 'Registrarse',
                      onTap: RegistroScreen(),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
