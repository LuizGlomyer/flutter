import 'package:flutter/material.dart';
import 'package:tab_bar/PrimeiraPagina.dart';
import 'package:tab_bar/SegundaPagina.dart';
import 'package:tab_bar/TerceiraPagina.dart';

void main() => runApp(
  MaterialApp(
    home: Home(),
  )
);


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  TabController __tabController; // devemos colocar na tabbar e na tabbarview



  @override
  void initState() {
    super.initState();
    __tabController = TabController(
      length: 3,
      vsync: this, // o mixin chamado irá cuidar da animação feita entre as tabs
      initialIndex: 1, // aba inicial
    );
  }

  @override
  void dispose() {
    super.dispose();
    __tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abas"),
        bottom: TabBar(
          controller: __tabController,
          tabs: <Widget>[ // definição do botão clicável da tab
            Tab(
              text: "Home",
              icon: Icon(Icons.home),
            ),
            Tab(
              text: "Email",
              icon: Icon(Icons.email),
            ),
            Tab(
              text: "Conta",
              icon: Icon(Icons.account_circle),
            ),
          ],
        ), // conteúdo que fica alocado logo abaixo da appbar
      ),

      body: TabBarView( // para mostrar o conteúdo de cada tab
        controller: __tabController,
        children: <Widget>[ // cada widget se refere a uma tab diferente ou seja, define o conteúdo de cada tab
          PrimeiraPagina(),
          SegundaPagina(),
          TerceiraPagina()
        ],
      ),

    );
  }
}
