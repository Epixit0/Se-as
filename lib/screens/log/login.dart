// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'package:first_app/screens/log/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:first_app/components/scaffold_home.dart';
import 'package:flutter/scheduler.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _con = LoginController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timestamp) {
      _con.init(context, refresh);
    });
  }

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
                  key: _con.formLoginKey,
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
                          _con.correo.text = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese un correo';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: _con.correo,
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
                          _con.contrasena.text = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese la contraseña';
                          }
                          return null;
                        },
                        controller: _con.contrasena,
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
                            if (_con.formLoginKey.currentState!.validate()) {
                              _con.formLoginKey.currentState!.save();
                              _con.login();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlue),
                          child: const Text(
                            'Iniciar Sesion',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
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

  void refresh() {
    setState(() {});
  }
}
