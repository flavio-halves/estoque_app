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

  // Objeto -> linha do banco (Map)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'categoria': categoria,
      'preco': preco,
      'quantidade': quantidade,
    };
  }

  // Linha do banco (Map) -> objeto
  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      id: map['id'] as int?,
      nome: map['nome'] as String,
      categoria: map['categoria'] as String,
      preco: (map['preco'] as num).toDouble(),
      quantidade: map['quantidade'] as int,
    );
  }
}
