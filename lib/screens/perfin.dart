import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/screens/firstScreen.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 0, 105, 155),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            padding: const EdgeInsets.all(15),
            color: const Color.fromARGB(255, 1, 39, 57),
            child: Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.account_circle_outlined,
                    size: 70,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    _auth.currentUser?.email ?? 'Email',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            color: const Color.fromARGB(255, 1, 39, 57),
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                signOut();
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.settings_power_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Cerrar Sesion',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void signOut() async {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }
}
