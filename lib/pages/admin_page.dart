import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fond blanc pour toute la page
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage:
                AssetImage('assets/logo.png'), // Logo en haut à gauche
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.blue, // Cercle bleu
              child: Icon(Icons.person,
                  color: Colors.black), // Icône noire dans le cercle
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // Vous pouvez modifier l'alignement ici
          mainAxisAlignment: MainAxisAlignment.start, // Modifier si besoin
          children: [
            // Texte "Administrateur" positionné en haut de la page
            Text(
              'Administrateur',
              style: GoogleFonts.inknutAntiqua(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Texte en noir
              ),
              textAlign: TextAlign.start, // Aligner à gauche, à modifier
            ),
            SizedBox(height: 50), // Espacement entre le titre et les options
            // First Row of Options (2 cards)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildAdminOption(
                  context,
                  'Gestion des élèves',
                  'assets/Students-cuate.png',
                  () {
                    // Naviguer vers la page de gestion des élèves
                  },
                ),
                _buildAdminOption(
                  context,
                  'Gestion des profs',
                  'assets/Teacher-pana.png',
                  () {
                    // Naviguer vers la page de gestion des profs
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            // Second Row of Options (1 card)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAdminOption(
                  context,
                  'Gestion des emplois',
                  'assets/Office management-cuate 1.png',
                  () {
                    // Naviguer vers la page de gestion des emplois
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdminOption(BuildContext context, String title, String imagePath,
      VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          width: 150, // Ajustement pour plus d'espace autour de l'image
          height: 200, // Ajustement pour donner plus d'espace aux éléments
          decoration: BoxDecoration(
            color: Color(0xFF85BEF5), // Fond bleu clair
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath, height: 100), // Image agrandie
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12, // Texte réduit pour mieux s'adapter
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Texte en noir
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
