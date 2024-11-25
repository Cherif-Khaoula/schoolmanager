import 'package:flutter/material.dart';

class ProfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page du Professeur'),
      ),
      body: Center(
        child: Text('Bienvenue sur la page du professeur !'),
      ),
    );
  }
}
