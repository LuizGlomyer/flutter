import 'package:flutter/material.dart';

import 'CustomSearchDelegate.dart';
import 'Telas/Biblioteca.dart';
import 'Telas/EmAlta.dart';
import 'Telas/Inicio.dart';
import 'Telas/Inscricoes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //var _telaAtual = Container();
  int _indiceBar = 0;
  String _pesquisa = "";

  @override
  Widget build(BuildContext context) {


    List<Widget> _telas = [
      Inicio(_pesquisa),
      EmAlta(),
      Inscricoes(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 1,

        ), // tema padrão para ícones, todos os ícones irão seguí-l
        backgroundColor: Colors.white,
        title: Image.asset("img/youtube.png", height: 23,),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){},
          ),

          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async { // pois quando o botão é pressionado ele não faz o retorno até que haja a confirmação
              String a = await showSearch(context: context, delegate: CustomSearchDelegate());
              setState(() {
                _pesquisa = a;
              });
            },
          ),

          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){},
          ),

        ],
      ),

      body: Container(
        padding: EdgeInsets.all(5),
        child: _telas[_indiceBar], // para troca dinâmica entre telas, basta mudar só o índice
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceBar, // índice selecionado
        fixedColor: Colors.red, // cor dos itens
        type: BottomNavigationBarType.fixed, // fixed por padrão, a partir de 4 icones é mudado automaticamente para shifting, que muda o background de toda bottombar
        onTap: (indice){ // os indices vão até a quantidade de itens presentes, começando no 0
          setState(() {
            _indiceBar = indice;
          });
        },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.teal, // serve apenas para o tipo shifting
              title: Text("Início"),
              icon: Icon(Icons.home)
            ),

            BottomNavigationBarItem(
              backgroundColor: Colors.brown,
                title: Text("Em alta"),
                icon: Icon(Icons.whatshot)
            ),

            BottomNavigationBarItem(
              backgroundColor: Colors.blueGrey,
                title: Text("Inscrições"),
                icon: Icon(Icons.subscriptions)
            ),

            BottomNavigationBarItem(
              backgroundColor: Colors.yellow,
                title: Text("Biblioteca"),
                icon: Icon(Icons.folder)
            ),
          ],
      ),
      
    );
  }
}
