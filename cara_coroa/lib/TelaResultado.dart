import 'package:flutter/material.dart';

class TelaResultado extends StatefulWidget {
  TelaResultado({int escolha})

  @override
  _TelaResultadoState createState() => _TelaResultadoState();
}

class _TelaResultadoState extends State<TelaResultado> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff61bd86),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("img/moeda_cara.png"),
          Padding(padding: EdgeInsets.only(top:40, bottom: 40)),
          Image.asset("img/botao_voltar.png"),
          Text()
        ],
      ),
    );
  }
}
