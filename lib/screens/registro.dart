import 'package:flutter/material.dart';
import 'package:first_app/screens/login.dart';
import 'package:first_app/widgets/scaffold_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({Key? key}) : super(key: key);

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final _formSignupKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String _nombre = '';
  String _correo = '';
  String _contrasena = '';
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return ScaffoldHome(
      image: 'images/registro.png',
      child: Column(
        children: [
          const Expanded(
            flex: 3,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 30.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Registro',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.lightBlue,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          _nombre = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese nombre completo';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Nombre'),
                          hintText: 'Ingrese nombre completo',
                          prefixIcon: const Icon(Icons.person),
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
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
                          hintText: 'Ingrese el correo',
                          prefixIcon: const Icon(Icons.email),
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          _contrasena = value;
                        },
                        obscureText: _obscureText,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese una contraseña';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Contraseña'),
                          hintText: 'Ingrese una contraseña',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formSignupKey.currentState?.validate() ??
                                false) {
                              try {
                                final result = await _auth
                                    .fetchSignInMethodsForEmail(_correo);

                                if (result.isNotEmpty) {
                                  _mostrarDialogCorreoExistente();
                                } else {
                                  final newUser = await _auth
                                      .createUserWithEmailAndPassword(
                                    email: _correo,
                                    password: _contrasena,
                                  );

                                  if (newUser.user != null) {
                                    await _firestore
                                        .collection('users')
                                        .doc(newUser.user!.uid)
                                        .set({
                                      'nombre': _nombre,
                                      'correo': _correo,
                                      'contrasena': _contrasena,
                                    });

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Home(),
                                      ),
                                    );
                                  }
                                }
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlue),
                          child: const Text(
                            'Registrarse',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Ya tienes cuenta? ',
                            style:
                                TextStyle(color: Colors.black45, fontSize: 15),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const LoginScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Inicia Sesion',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.lightBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _mostrarDialogCorreoExistente() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Correo Existente'),
          content: const Text(
              'El correo ingresado ya está registrado. Por favor, inicia sesión.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
