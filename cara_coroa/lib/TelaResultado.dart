import 'package:flutter/material.dart';

class TelaResultado extends StatefulWidget {
  int escolha;
  TelaResultado({this.escolha}); // NÃO ESQUECER DO THIS, CASO CONTRÁRIO O VALOR SERÁ NULO

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
          Image.asset("img/" +
              (widget.escolha == 0 ? "moeda_cara" : "moeda_coroa") + ".png"
          ),
          Padding(padding: EdgeInsets.only(top:40, bottom: 40)),
          GestureDetector(
            child: Image.asset("img/botao_voltar.png"),
            onTap: (){ Navigator.pop(context); }, // ele fecha a tela que está presente
          ),
        ],
      ),
    );
  }
}
