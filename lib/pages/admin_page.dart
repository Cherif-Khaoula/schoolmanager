import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page de l\'Administrateur'),
      ),
      body: Center(
        child: Text('Bienvenue sur la page de l\'administrateur !'),
      ),
    );
  }
}
