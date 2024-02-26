import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String _oldPassword = '';
  String _newPassword = '';
  String _newPasswordConfirmation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 162, 195, 211),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
                'Cambiar Contraseña',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 30),
              _buildPasswordField(
                  'Contraseña Antigua', (value) => _oldPassword = value),
              const SizedBox(height: 20),
              _buildPasswordField(
                  'Nueva Contraseña', (value) => _newPassword = value),
              const SizedBox(height: 20),
              _buildPasswordField('Confirmar Nueva Contraseña',
                  (value) => _newPasswordConfirmation = value),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueGrey),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: _changePassword,
                child: const Text(
                  'Cambiar Contraseña',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField(String label, Function(String) onChanged) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: true,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.white24,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white70),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        prefixIcon: Icon(Icons.lock, color: Colors.white),
      ),
    );
  }

  void _changePassword() async {
    if (_newPassword == _newPasswordConfirmation) {
      try {
        AuthCredential credential = EmailAuthProvider.credential(
          email: _auth.currentUser!.email!,
          password: _oldPassword,
        );

        await _auth.currentUser!.reauthenticateWithCredential(credential);

        await _auth.currentUser!.updatePassword(_newPassword);

        await _updatePasswordInFirestore(_auth.currentUser!.uid, _newPassword);

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Contraseña Cambiada'),
              content: const Text('La contraseña se ha cambiado exitosamente.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('Aceptar'),
                ),
              ],
            );
          },
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error al Cambiar Contraseña'),
              content: const Text(
                  'No se pudo cambiar la contraseña. Verifica la contraseña antigua.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Aceptar'),
                ),
              ],
            );
          },
        );
        print(e);
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'Las contraseñas nuevas no coinciden. Verifique e intente de nuevo.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Aceptar'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> _updatePasswordInFirestore(
      String userId, String newPassword) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'contrasena': newPassword,
      });
    } catch (e) {
      print('Error updating password in Firestore: $e');
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: ChangePasswordScreen(),
  ));
}
