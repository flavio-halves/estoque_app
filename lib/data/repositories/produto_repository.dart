import '../db/app_database.dart';
import '../../models/produto.dart';

class ProdutoRepository {
  static final ProdutoRepository instance = ProdutoRepository._interno();
  ProdutoRepository._interno();

  // Lê todos os produtos do banco (ordenados por nome).
  Future<List<Produto>> listar() async {
    final db = await AppDatabase.instance;
    final linhas = await db.query('produtos', orderBy: 'nome');
    return linhas.map((linha) => Produto.fromMap(linha)).toList();
  }

  // Grava um novo produto no banco.
  Future<void> adicionar(Produto p) async {
    final db = await AppDatabase.instance;
    await db.insert('produtos', p.toMap());
  }
}
