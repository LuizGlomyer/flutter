import 'package:flutter/material.dart';

class TelaErro extends StatefulWidget {
  @override
  _TelaErroState createState() => _TelaErroState();
}

class _TelaErroState extends State<TelaErro> {
  @override
  Widget build(BuildContext context) {
    return Center( // o FutureBuilder (ou pelo menos a IDE) sugere que tenha um retorno. Este retorno é o retorno de erro
      child: Text(
        "Erro de conexão",
        style: TextStyle(
            fontSize: 40,
            color: Colors.red
        ),
      ),
    );
  }
}
