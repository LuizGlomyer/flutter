import 'package:flutter/material.dart';
import 'dart:math';

enum Escolha {Pedra, Papel, Tesoura}

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  @override

  var _imagemPadrao = AssetImage("images/padrao.png"), texto = "", cor = Colors.black;
  var escolha_usuario, escolha_cpu;
  List<Escolha> possibilidades = [Escolha.Pedra, Escolha.Papel, Escolha.Tesoura];

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
                child: Text("Escolha do app",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Image(image: this._imagemPadrao),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(texto, style: TextStyle(color: cor),),
              ),
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
                  GestureDetector(
                    child: Image.asset("images/pedra.png", height: 100),
                    onTap: (){
                      setState(() {
                        escolha_cpu = possibilidades[Random().nextInt(3)];
                        if(escolha_cpu == Escolha.Pedra){
                            texto = "Empate!";
                            _imagemPadrao = AssetImage("images/pedra.png");
                            cor = Colors.black;
                        }
                        if(escolha_cpu == Escolha.Papel){
                            texto = "Perdeste!";
                            _imagemPadrao = AssetImage("images/papel.png");
                            cor = Colors.red;
                        }
                        if(escolha_cpu == Escolha.Tesoura){
                            texto = "Ganhaste!";
                            _imagemPadrao = AssetImage("images/tesoura.png");
                            cor = Colors.green;
                        }
                      });
                    },
                  ),
                  GestureDetector(
                      child: Image.asset("images/papel.png", height: 100),
                      onTap: (){
                      setState(() {
                        escolha_cpu = possibilidades[Random().nextInt(3)];
                        if(escolha_cpu == Escolha.Pedra){
                          texto = "Ganhaste!";
                          _imagemPadrao = AssetImage("images/pedra.png");
                          cor = Colors.green;
                        }
                        if(escolha_cpu == Escolha.Papel){
                          texto = "Empate!";
                          _imagemPadrao = AssetImage("images/papel.png");
                          cor = Colors.black;
                        }
                        if(escolha_cpu == Escolha.Tesoura) {
                          texto = "Perdeste!";
                          _imagemPadrao = AssetImage("images/tesoura.png");
                          cor = Colors.red;
                        }
                      });
                    }
                  ),
                  GestureDetector(
                      child: Image.asset("images/tesoura.png", height: 100),
                      onTap: (){
                      setState(() {
                        escolha_cpu = possibilidades[Random().nextInt(3)];
                        if(escolha_cpu == Escolha.Pedra){
                          setState(() {
                            texto = "Perdeste!";
                            _imagemPadrao = AssetImage("images/pedra.png");
                            cor = Colors.red;
                          });
                        }
                        if(escolha_cpu == Escolha.Papel){
                          setState(() {
                            texto = "Ganhaste!";
                            _imagemPadrao = AssetImage("images/papel.png");
                            cor = Colors.green;
                          });
                        }
                        if(escolha_cpu == Escolha.Tesoura) {
                          setState(() {
                            texto = "Empate!";
                            _imagemPadrao = AssetImage("images/tesoura.png");
                            cor = Colors.black;
                          });
                        }
                      });
                    }
                  ),
                ],
              )
            ],
          ),
      )
      //bottomNavigationBar: ,
    );
  }
}
