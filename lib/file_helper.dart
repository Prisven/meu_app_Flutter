import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:crypto/crypto.dart';

// hash da senha
String hashPassword(String senha) {
  return sha256.convert(utf8.encode(senha)).toString();
}

Future<File> _getFile() async {
  final dir = await getApplicationDocumentsDirectory();
  return File('${dir.path}/usuarios.json');
}

Future<void> salvarUsuario(String email, String password, String cpf, String nome) async {
  final file = await _getFile();

  List usuarios = [];

  if (await file.exists()) {
    String content = await file.readAsString();
    usuarios = jsonDecode(content);
  }

  usuarios.add({
    "email": email,
    "password": hashPassword(password),
    "cpf": cpf,
    "nome": nome,
  });

  await file.writeAsString(jsonEncode(usuarios));
}