import 'package:flutter/material.dart';
import '../../core/rotas.dart';
import '../../data/repositories/produto_repository.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final _repo = ProdutoRepository.instance;
  @override
  Widget build(BuildContext context) {
    final produtos = _repo.listar();
    return Scaffold(
      appBar: AppBar(
        title: const Text('EstoqueApp'),
        actions: [
          IconButton(
            tooltip: 'Sair',
            onPressed: () =>
                Navigator.pushReplacementNamed(context, Rotas.login),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: produtos.isEmpty
          ? const Center(child: Text('Nenhum produto cadastrado.'))
          : ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, i) {
          final p = produtos[i];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.inventory_2_outlined),
              title: Text(p.nome),
              subtitle: Text('${p.categoria}  -  Qtd: ${p.quantidade}'),
              trailing: Text('R\$ ${p.preco.toStringAsFixed(2)}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, Rotas.cadastro);
          setState(() {}); // ao voltar, recarrega a lista
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}