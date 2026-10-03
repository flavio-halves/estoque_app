class Produto {
  final int? id;
  final String nome;
  final String categoria;
  final double preco;
  final int quantidade;

  Produto({
    this.id,
    required this.nome,
    required this.categoria,
    required this.preco,
    this.quantidade = 0,
  });
}
