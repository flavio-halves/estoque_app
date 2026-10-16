import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {
  // Guarda o banco já aberto (uma vez só).
  static Database? _db;

  // Devolve o banco; abre na primeira vez que for usado.
  static Future<Database> get instance async {
    _db ??= await _abrir();
    return _db!;
  }

  static Future<Database> _abrir() async {
    final caminho = join(await getDatabasesPath(), 'estoque.db');

    return openDatabase(
      caminho,
      version: 1,
      onCreate: (db, versao) async {
        await db.execute('''
          CREATE TABLE produtos (
            id         INTEGER PRIMARY KEY AUTOINCREMENT,
            nome       TEXT    NOT NULL,
            categoria  TEXT    NOT NULL,
            preco      REAL    NOT NULL,
            quantidade INTEGER NOT NULL
          )
        ''');
      },
    );
  }
}
