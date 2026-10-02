import 'package:flutter/material.dart';

import 'core/rotas.dart';
import 'core/tema.dart';
import 'ui/telas/home_screen.dart';
import 'ui/telas/login_screen.dart';


void main() {
  runApp(const EstoqueApp());
}

class EstoqueApp extends StatelessWidget {
  const EstoqueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EstoqueApp',
      theme: TemaApp.tema,
      initialRoute: Rotas.login,
      routes: {
        Rotas.login: (context) => const LoginScreen(),
        Rotas.home: (context) => const HomeScreen(),
      },
    );
  }
}
