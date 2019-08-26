import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() => runApp(
  MaterialApp(
    home: Home(),
  )
);


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _recuperarBancoDados() async {
    final caminhoBD = await getDatabasesPath();
    final localBD = join(caminhoBD,
        "banco.db"); // só para constar, não é o join de banco de dados

    var bd = await openDatabase(
      localBD,
      version: 1, // devemos definir a versão
      onCreate: (db, dbVersaoRecente){
        String sql = "  CREATE TABLE usuarios (id INTEGER PRIMARY KEY, nome VARCHAR, idade INTEGER)";
        db.execute(sql); // executa um código sql
      }
    );
    print("aberto: " + bd.isOpen.toString());
    return bd;
  }

  _salvar() async {
    Database bd = await _recuperarBancoDados();
    Map<String, dynamic> dadosUsuario = {
      "nome" : "D",
      "idade" : 30,
    };
    int id = await bd.insert("usuarios", dadosUsuario); // id é o retorno do método insert
    print("Salvo: $id");
  }

  _listarUsuarios() async {
    Database bd = await _recuperarBancoDados();
    String sql = "SELECT distinct nome FROM usuarios";
    List usuarios = await bd.rawQuery(sql); // retorna uma lista de Maps
    print(usuarios.toString());
  }

  @override
  Widget build(BuildContext context) {
    _recuperarBancoDados();
    _listarUsuarios();
    return Container(color: Colors.red,);
  }
}
