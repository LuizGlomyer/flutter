import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controle = TextEditingController();
  String _textField = "";

  _salvar(){

  }

  _recuperar() {
    setState(() {
      _textField = _controle.text;
    });
  }

  _remover(){

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
                labelText: "Digite algo:"
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
