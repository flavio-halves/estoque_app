import '../../core/rotas.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EstoqueApp'),
        actions: [
          IconButton(
            tooltip: 'Sair',
            onPressed: () {
              //Navigator.pushReplacementNamed(context, '/');
              Navigator.pushReplacementNamed(
                context,
                Rotas.login,
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Login realizado com sucesso!',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
