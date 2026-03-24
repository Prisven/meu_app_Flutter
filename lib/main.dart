import 'package:flutter/material.dart';
import 'package:banco_prototipo/cadastro.dart';
import 'file_helper.dart';
import 'TelaInicio.dart';


class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String mensagem ='';

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // validar campos vazios
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Preencha todos os campos')),
      );
      return;
    }

    // verificar credenciais
    try {
      bool success = await loginUsuario(email, password);
      
      if (success) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => TelaInicio()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email ou senha incorretos')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao verificar credenciais: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brasil-Italia'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login", style: TextStyle(fontSize: 30)),
            SizedBox(height: 20),
            Container(
              width: 250,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 250,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Senha"),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: Text("Entrar"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaCadastro()),
                );
              },
              child: Text("Registrar"),
            ),
          ],
        ),
      ),
    );
  }
}

class TelaLogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brasil-Italia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),   
       home: Scaffold(
        appBar: AppBar(
          title: const Text('Brasil-Italia'),
        ),
        body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      Text("Login", style: TextStyle(fontSize: 30)),

      SizedBox(height: 20),

      Container(
        width: 250,
        child: TextField(
          decoration: InputDecoration(labelText: "Email"),
        ),
      ),

      SizedBox(height: 10),

      Container(
        width: 250,
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(labelText: "Senha"),
        ),
      ),

      SizedBox(height: 20),

      ElevatedButton(
        onPressed: () {},
        child: Text("Entrar"),
      ),

      SizedBox(height: 20),

      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TelaCadastro()),
          );
        },
        child: Text("Registrar"),
      ),
    ]
  ),
),
      ),
    );
  }
}  