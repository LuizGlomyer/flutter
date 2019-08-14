import 'package:flutter/material.dart';

import 'TelaPrincipal.dart';


class TelaSecundaria extends StatefulWidget {

  String valor;
  TelaSecundaria({this.valor}); // necessário para a passagem de dados entre telas
  // {} denotam parâmetros opcionais

  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {



  @override

  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Tela secundária "),
        backgroundColor: Colors.purple,
      ),

      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text("Valor passado: ${widget.valor}"), // widget consegue recuperar o parâmetro que foi passado pelo construtor da classe TelaSecundaria
            Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
            RaisedButton(
              child: Text("Primeira Tela"),
              padding: EdgeInsets.all(15),
              onPressed: (){
                //Navigator.pushNamed(context, "/secundaria");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaPrincipal())
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(),
    );
  }
}
