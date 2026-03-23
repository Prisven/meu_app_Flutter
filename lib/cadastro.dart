import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';
import 'file_helper.dart';

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cpfController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void registrar() async {
    String nome = nomeController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cpf = cpfController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    // validar campos vazios
    if (nome.isEmpty || email.isEmpty || password.isEmpty || cpf.isEmpty) {
      Fluttertoast.showToast(msg: 'Preencha todos os campos');
      return;
    }

    // validar senha
    if (password != confirmPassword) {
      Fluttertoast.showToast(msg: 'As senhas não coincidem');
      return;
    }

    // salvar usuário
    try {
      await salvarUsuario(email, password, cpf, nome);
      Fluttertoast.showToast(msg: 'Cadastro realizado com sucesso!');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Erro ao salvar usuário: $e');
      return;
    }
    await salvarUsuario(nome, email, password, cpf);

    Fluttertoast.showToast(msg: 'Cadastro realizado com sucesso!');

    // limpar campos
    nomeController.clear();
    emailController.clear();
    passwordController.clear();
    cpfController.clear();
    confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Criar Conta", style: TextStyle(fontSize: 28)),

              SizedBox(height: 20),

              campo(nomeController, "Nome Completo"),
              campo(emailController, "Email"),
              campo(passwordController, "Senha", true),
              campo(confirmPasswordController, "Confirmar Senha", true),
              campo(cpfController, "CPF"),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: registrar,
                child: Text("Registrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget campo(TextEditingController controller, String label, [bool senha = false]) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: 300,
        child: TextField(
          controller: controller,
          obscureText: senha,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}