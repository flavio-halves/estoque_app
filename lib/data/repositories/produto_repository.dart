import '../../models/produto.dart';
class ProdutoRepository {
// Instância única (por enquanto, os dados ficam na memória).
  static final ProdutoRepository instance = ProdutoRepository._interno();
  ProdutoRepository._interno();
  final List<Produto> _produtos = [
    Produto(nome: 'Caneta azul',   categoria: 'Papelaria',
        preco: 3.50,  quantidade: 20),

    Produto(nome: 'Caderno 96fls', categoria: 'Papelaria',
        preco: 15.90, quantidade: 8),
  ];
  List<Produto> listar() => List.unmodifiable(_produtos);
  void adicionar(Produto p) => _produtos.add(p);
}