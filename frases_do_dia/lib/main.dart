import "package:flutter/material.dart";

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // tira a tarja de  debug
    title: "Frases do dia", // nome do app
    color: Colors.green,
    home: Scaffold( // define uma estrutura para o app: barra de navegação superior, área de conteúdo e barra inferior
      appBar: AppBar(
        title: Text("Texto"),
        backgroundColor: Colors.deepOrangeAccent,
      ), // cria a barra superior do app
      body: Padding( // é o corpo do app,
          padding: EdgeInsets.all(16),
          child: Text("Conteúdo principal"),
      ),
      bottomNavigationBar: BottomAppBar( // começa invisível, devemos setar um filho para ela aparecer
        color: Colors.blue,
        child: Padding( // dá um padding ao objeto filho
          padding: EdgeInsets.all(16),
          child: Row( // row é ideal pois a bar é uma linha horizontal
            children: <Widget>[ // é interessante colocar botões em uma fila horizontal
              Text("Bottom bar"),
              Text("Bottom bar"),
              Text("Bottom bar"),
              Text("Bottom bar"),
            ],
          ),
        ),
      ),
    ),
  ));
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
