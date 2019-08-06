import 'package:flutter/material.dart';

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

  var frase = "Clique no botão para gerar uma frase";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Frases do dia"),
        ),

      body: Container(
        //padding: EdgeInsets.all(30),
        child: Column( // a coluna, a pesar de ser filha do body, não ocupa tod0 o espaço da tela
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/logo.png"),
            Text(frase),
            RaisedButton(
              child: Text("Nova frase"),
              onPressed: (){

              },
              splashColor: Colors.greenAccent,
            ),
          ],
        ),
      )
    );
  }
}
