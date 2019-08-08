import 'package:flutter/material.dart';
import 'dart:math';

enum Escolha {Pedra, Papel, Tesoura}

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

// MÉTODOS onPressed ou onTap SÓ ACEITAM PARÂMENTROS SE O IDENTIFICADOR DA FUNÇÃO (NOME DELA) NÃO ESTIVER PRECEDIDO DE UM TIPO, NEM MESMO VOID

class _JogoState extends State<Jogo> {
  @override

  var _imagemPadrao = AssetImage("images/padrao.png"), texto = "", cor = Colors.black; // outra forma de colocar imagem
  var escolha_usuario, escolha_cpu;
  List<Escolha> possibilidades = [Escolha.Pedra, Escolha.Papel, Escolha.Tesoura];

  void escolhaUsuario(Escolha e){
    escolha_cpu = possibilidades[Random().nextInt(3)];
    setState(() {
      switch(e){
        case Escolha.Pedra:
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
          break;

        case Escolha.Papel:
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
            break;

        case Escolha.Tesoura:
          if(escolha_cpu == Escolha.Pedra){
              texto = "Perdeste!";
              _imagemPadrao = AssetImage("images/pedra.png");
              cor = Colors.red;
          }
          if(escolha_cpu == Escolha.Papel){
              texto = "Ganhaste!";
              _imagemPadrao = AssetImage("images/papel.png");
              cor = Colors.green;
          }
          if(escolha_cpu == Escolha.Tesoura) {
              texto = "Empate!";
              _imagemPadrao = AssetImage("images/tesoura.png");
              cor = Colors.black;
          }
          break;
      }
    });
  }

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

              Image(image: this._imagemPadrao), // outra forma de colocar imagem

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
                    onTap: () => escolhaUsuario(Escolha.Pedra) // necessário ao se passar parêmetros
                  ),
                  GestureDetector(
                      child: Image.asset("images/papel.png", height: 100),
                      onTap: () => escolhaUsuario(Escolha.Papel)
                  ),
                  GestureDetector(
                      child: Image.asset("images/tesoura.png", height: 100),
                      onTap: () => escolhaUsuario(Escolha.Tesoura)
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
