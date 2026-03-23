import 'package:flutter/material.dart';
import 'package:banco_prototipo/cadastro.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaLogin(),
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