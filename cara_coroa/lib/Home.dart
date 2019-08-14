import 'dart:math';
import 'package:flutter/material.dart';
import 'TelaResultado.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {


    return Container(
      color: Color(0xff61bd86), // sempre começa com 0xff para indicar hexadecimal
      //Color.fromRGBO(r, g, b, opacity) outro método, opacidade são valores de 0 a 1
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("img/logo.png"),
          Padding(padding: EdgeInsets.only(top: 25, bottom: 25)),
          GestureDetector(
            child: Image.asset("img/botao_jogar.png"),
            onTap: _exibirResultado,
          )
        ],
      ),
    );
  }

  void _exibirResultado() {
    int escolha = Random().nextInt(2);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TelaResultado()
        )
    );
  }
}
