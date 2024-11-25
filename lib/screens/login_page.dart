// lib/screens/login_page.dart
import 'package:flutter/material.dart';
import 'package:schoolmanager/services/database_helper.dart'; // Importer votre helper de base de données

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  String _message = '';

  Future<void> _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    bool success = await _databaseHelper.login(
        email, password); // Méthode de login dans votre DatabaseHelper

    setState(() {
      if (success) {
        _message = 'Connexion réussie!';
      } else {
        _message = 'Email ou mot de passe incorrect.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Connexion")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Se connecter'),
            ),
            SizedBox(height: 20),
            Text(_message), // Affichage du message d'erreur ou de succès
          ],
        ),
      ),
    );
  }
}
