// ignore_for_file: use_build_context_synchronously, prefer_final_fields, deprecated_member_use, unrelated_type_equality_checks

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/auth/auth.dart';
import 'package:first_app/screens/home/home.dart';
import 'package:flutter/material.dart';

class LoginController {
  late BuildContext context;
  late Function refresh;

  late AuthAppProvider _auth;

  final user = FirebaseAuth.instance;

  TextEditingController correo = TextEditingController();
  TextEditingController contrasena = TextEditingController();

  final formLoginKey = GlobalKey<FormState>();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;

    _auth = AuthAppProvider();
  }

  void login() async {
    String email = correo.text.trim();
    String password = contrasena.text.trim();

    try {
      bool isLogin = await _auth.login(email, password);
      if (isLogin) {
        if (user.currentUser != null) {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("El usuario ha iniciado Sesion"),
              backgroundColor: Color(0xFF36499B),
              elevation: 10,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Correo o contraseña incorrectos"),
              backgroundColor: Color(0xFF36499B),
              elevation: 10,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("the user cannot be authenticated"),
            backgroundColor: Color(0xFF36499B),
            elevation: 10,
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $e"),
          backgroundColor: const Color(0xFF36499B),
          elevation: 10,
        ),
      );
    }
  }
}
