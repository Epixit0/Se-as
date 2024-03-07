// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'package:first_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:first_app/widgets/scaffold_home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formLoginKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String _correo = '';
  String _contrasena = '';

  @override
  Widget build(BuildContext context) {
    return ScaffoldHome(
        image: 'images/login.png',
        child: Column(
          children: [
            const Expanded(
              flex: 3,
              child: SizedBox(
                height: 18,
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                  padding: const EdgeInsets.fromLTRB(25, 30, 25, 20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      )),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formLoginKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Iniciar Sesion',
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.lightBlue,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              onChanged: (value) {
                                _correo = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor ingrese un correo';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                label: const Text('Correo'),
                                hintText: 'Ingrese su Correo',
                                prefixIcon: const Icon(Icons.email),
                                hintStyle: const TextStyle(
                                  color: Colors.black26,
                                ),
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black12,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              obscureText: true,
                              obscuringCharacter: '*',
                              onChanged: (value) {
                                _contrasena = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor ingrese la contraseña';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                label: const Text('Contraseña'),
                                hintText: 'Ingresar Contraseña',
                                prefixIcon: const Icon(Icons.lock),
                                hintStyle: const TextStyle(
                                  color: Colors.black26,
                                ),
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black12,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formLoginKey.currentState
                                            ?.validate() ??
                                        false) {
                                      try {
                                        final user = await _auth
                                            .signInWithEmailAndPassword(
                                          email: _correo.trim(),
                                          password: _contrasena,
                                        );

                                        if (user != null) {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Home(),
                                            ),
                                          );
                                        }
                                      } on FirebaseAuthException catch (e) {
                                        String message;

                                        switch (e.code) {
                                          case 'user-not-found':
                                            message =
                                                'No existe un usuario con este correo electrónico.';
                                            break;
                                          case 'wrong-password':
                                            message =
                                                'La contraseña es incorrecta.';
                                            break;
                                          default:
                                            message =
                                                'Ocurrió un error al iniciar sesión.';
                                            break;
                                        }

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(message),
                                          ),
                                        );
                                      } catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content:
                                                Text('Error: ${e.toString()}'),
                                          ),
                                        );
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.lightBlue),
                                  child: const Text(
                                    'Iniciar Sesion',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ))
                          ]),
                    ),
                  )),
            ),
          ],
        ));
  }
}
