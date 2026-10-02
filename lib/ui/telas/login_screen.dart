import '../../core/rotas.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Identifica e controla o formulário.
  final _formKey = GlobalKey<FormState>();

  // Controladores dos campos.
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  // Controla a visibilidade da senha e o carregamento.
  bool _ocultarSenha = true;
  bool _carregando = false;

  @override
  void dispose() {
    // Libera os controladores quando a tela é destruída.
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  String? _validarEmail(String? valor) {
    if (valor == null || valor.trim().isEmpty) {
      return 'Informe seu e-mail';
    }

    if (!valor.contains('@') || !valor.contains('.')) {
      return 'Informe um e-mail válido';
    }

    return null;
  }

  String? _validarSenha(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Informe sua senha';
    }

    if (valor.length < 6) {
      return 'A senha deve possuir pelo menos 6 caracteres';
    }

    return null;
  }

  Future<void> _entrar() async {
    // Executa todos os validadores do formulário.
    final formularioValido =
        _formKey.currentState?.validate() ?? false;

    if (!formularioValido) {
      return;
    }

    setState(() {
      _carregando = true;
    });

    // Pequena espera para simular uma autenticação.
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) {
      return;
    }

    final email = _emailController.text.trim();
    final senha = _senhaController.text;

    if (email == 'admin@estoque.com' && senha == '123456') {
      //Navigator.pushReplacementNamed(context, '/home');
      Navigator.pushReplacementNamed(
        context,
        Rotas.home,
      );

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('E-mail ou senha incorretos'),
          backgroundColor: Colors.red,
        ),
      );
    }

    if (mounted) {
      setState(() {
        _carregando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 420,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(
                      Icons.inventory_2_outlined,
                      size: 90,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'EstoqueApp',
                      textAlign: TextAlign.center,
                      style:
                      Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Controle seu estoque de maneira simples',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 32),

                    // Campo de e-mail
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      autocorrect: false,
                      validator: _validarEmail,
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        hintText: 'Digite seu e-mail',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Campo de senha
                    TextFormField(
                      controller: _senhaController,
                      obscureText: _ocultarSenha,
                      textInputAction: TextInputAction.done,
                      validator: _validarSenha,
                      onFieldSubmitted: (_) => _entrar(),
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        hintText: 'Digite sua senha',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          tooltip: _ocultarSenha
                              ? 'Mostrar senha'
                              : 'Ocultar senha',
                          onPressed: () {
                            setState(() {
                              _ocultarSenha = !_ocultarSenha;
                            });
                          },
                          icon: Icon(
                            _ocultarSenha
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Botão de entrada
                    FilledButton.icon(
                      onPressed: _carregando ? null : _entrar,
                      icon: _carregando
                          ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                          : const Icon(Icons.login),
                      label: Text(
                        _carregando ? 'Entrando...' : 'Entrar',
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Acesso para teste:\n'
                          'admin@estoque.com | Senha: 123456',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
