import 'package:flutter/material.dart';

class ElevePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page de l\'Élève'),
      ),
      body: Center(
        child: Text('Bienvenue sur la page de l\'élève !'),
      ),
    );
  }
}
