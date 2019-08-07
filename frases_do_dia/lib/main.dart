import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Frases do dia",
      color: Colors.green,
      home: Home(),
    )
  );
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _listaFrases = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    "Duis pulvinar elit nec purus tincidunt tempor.",
    "In vitae purus at purus pellentesque mollis at ac arcu.",
    "In porta, arcu vel sagittis semper, ante lorem volutpat lorem, et fringilla lacus orci quis justo.",
    "Vestibulum eu mi gravida, laoreet lorem ut, porttitor ligula."
  ];

  var _frase = "Clique no botão para gerar uma frase";
  var _cor  = Color.fromRGBO(06, 97, 124, 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[ // lista de widgets que ficarão na appbar
          IconButton(
            icon: Icon(Icons.account_balance),
            splashColor: Colors.white,
            onPressed: (){ // se o onpressed for null o botão não é clicável
              if(_cor == Colors.green)
                setState(() {
                  _cor = Colors.lightGreen;
                });
              else
                setState(() {
                  _cor = Colors.green;
                });
              print("Icone");
            },
          ),
        ],
        backgroundColor: _cor,
        title: Text("Frases do dia"),
        ),
      //poderíamos colocar o Container dentro do widget Center, no seu child, para centralizar o conteúdo
      body: Container( // o container se ajusta ao conteúdo, se ele não ocupar toda a página o container ocupará só o entorno do conteúdo, dificultando o alinhamento
        padding: EdgeInsets.fromLTRB(16, 40, 16, 20),
        width: double.infinity, // faz a largura ir até o limite horizontal da tela
        child: Column( // a coluna, a pesar de ser filha do body, não ocupa tod0 o espaço da tela
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // distribuir os elementos igualmente na tela
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/logo.png"),
            Text(
              _frase,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                color: Colors.black45
              )
            ),
            RaisedButton(
              child: Text("Nova frase"),
              onPressed: (){
                setState(() {
                  int a = Random().nextInt(_listaFrases.length);
                  _frase = _listaFrases[a];
                });
                print("PRESSIONADO");
              },
              splashColor: Colors.greenAccent,
            ),
          ],
        ),
      )
    );
  }
}
