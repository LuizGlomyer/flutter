import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controle = TextEditingController();
  String _textField = "";

  _salvar() async { // deve ser assíncrono
    String valorDigitado = _controle.text;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("nome", valorDigitado); // similar a um dicionário, primeiro a chave depois os dados
    // pode demorar ^
  }

  _recuperar() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _textField = prefs.getString("nome") ?? "";
    });
  }

  _remover() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("nome");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de dados"),
      ),

      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text(_textField),

            TextField(
              controller: _controle,
              decoration: InputDecoration(
                labelText: "Digite algo:",

              ),
            ),

            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("Salvar"),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: _salvar,
                ),

                RaisedButton(
                  child: Text("Recuperar"),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: _recuperar,
                ),

                RaisedButton(
                  child: Text("Remover"),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: _remover,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }


}
