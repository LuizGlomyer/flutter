import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
      ),
      body: Container(
        //padding: EdgeInsets.fromLTRB(16, 30, 16, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // para a coluna ir até a extremidade do objeto pai
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text("Escolha do app:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Image.asset("images/padrao.png"),
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text("Escolha uma opção abaixo",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset("images/pedra.png"),
                  Image.asset("images/papel.png"),
                  Image.asset("images/tesoura.png"),
                ],
              )
            ],
          ),
      )
      //bottomNavigationBar: ,
    );
  }
}
