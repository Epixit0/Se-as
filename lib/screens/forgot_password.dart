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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar Contraseña'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: (value) {
                _oldPassword = value;
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña Antigua',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (value) {
                _newPassword = value;
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Nueva Contraseña',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                await _changePassword();
              },
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
    );
  }

  Future<void> _changePassword() async {
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
