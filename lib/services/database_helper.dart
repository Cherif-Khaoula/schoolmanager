import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite_common_ffi/sqflite_ffi.dart'; // Import nécessaire pour le web

class DatabaseHelper {
  static Database? _database;

  // Initialisation de la base de données
  Future<void> _initDB() async {
    // Si vous êtes sur le Web, vous devez définir databaseFactory
    if (_database == null) {
      databaseFactory =
          databaseFactoryFfi; // Initialisation nécessaire pour Flutter Web

      // Récupérer le chemin de la base de données
      var dbPath = await getDatabasesPath();
      String path = join(dbPath, 'school_manager.db');

      // Ouvrir la base de données SQLite
      _database =
          await openDatabase(path, version: 1, onCreate: (db, version) async {
        // Création de la table des utilisateurs si elle n'existe pas
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT,
            password TEXT
          )
        ''');
      });
    }
  }

  // Récupérer la base de données, en s'assurant qu'elle soit initialisée
  Future<Database> get database async {
    // Si la base de données n'a pas été initialisée, on l'initialise
    if (_database == null) {
      await _initDB();
    }
    return _database!; // Retourner la base de données
  }

  // Méthode de connexion pour vérifier les identifiants
  Future<bool> login(String email, String password) async {
    final db = await database;

    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    return result
        .isNotEmpty; // Si des résultats sont trouvés, la connexion réussie
  }

  // Méthode pour ajouter un utilisateur
  Future<void> addUser(String email, String password) async {
    final db = await database;

    // Insertion d'un nouvel utilisateur dans la table
    await db.insert(
      'users',
      {'email': email, 'password': password},
      conflictAlgorithm: ConflictAlgorithm
          .replace, // Si un utilisateur existe, il sera remplacé
    );
  }
}
