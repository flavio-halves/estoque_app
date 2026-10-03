import 'package:flutter/material.dart';
import '../../data/repositories/produto_repository.dart';
import '../../models/produto.dart';
class CadastroProdutoScreen extends StatefulWidget {
const CadastroProdutoScreen({super.key});
@override
State<CadastroProdutoScreen> createState() => _CadastroProdutoScreenState();
}
class _CadastroProdutoScreenState extends State<CadastroProdutoScreen> {
final _formKey = GlobalKey<FormState>();
final _nomeController = TextEditingController();
final _categoriaController = TextEditingController();
final _precoController = TextEditingController();
final _quantidadeController = TextEditingController();
@override

 void dispose() {
    _nomeController.dispose();
    _categoriaController.dispose();
    _precoController.dispose();
    _quantidadeController.dispose();
    super.dispose();
  }
  void _salvar() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final produto = Produto(
      nome: _nomeController.text.trim(),
      categoria: _categoriaController.text.trim(),
      preco: double.parse(_precoController.text.replaceAll(',', '.')),
      quantidade: int.parse(_quantidadeController.text),
    );
    ProdutoRepository.instance.adicionar(produto);
    Navigator.pop(context); // volta para a Home
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo produto')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Informe o nome' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _categoriaController,
                decoration: const InputDecoration(labelText: 'Categoria'),
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Informe a categoria' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _precoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Preco'),
                validator: (v) {
                  final preco = double.tryParse(
                      (v ?? '').replaceAll(',', '.'));
                  if (preco == null || preco <= 0) return 'Preco invalido';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _quantidadeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Quantidade'),
                validator: (v) {
                  final q = int.tryParse(v ?? '');
                  if (q == null || q < 0) return 'Quantidade invalida';
                  return null;
                },
              ),
              const SizedBox(height: 24),
FilledButton.icon(
onPressed: _salvar,
icon: const Icon(Icons.save),
label: const Text('Salvar'),
),
],
),
),
),
);
}
}