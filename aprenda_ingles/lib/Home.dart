import 'package:aprenda_ingles/TabBichos.dart';
import 'package:aprenda_ingles/TabNumeros.dart';
import 'package:aprenda_ingles/TabVogais.dart';
import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  TabController _controleTab;

  @override
  void initState() {
    super.initState();
    _controleTab = TabController(
      length: 3,
      vsync: this
    );

  }

  @override
  void dispose() {
    super.dispose();
    _controleTab.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aprenda inglês"),
        //backgroundColor: Colors.brown,
        bottom: TabBar(
          indicatorWeight: 4, // barra que aparece indicando em qual aba estamos
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          indicatorColor: Colors.white,
          controller: _controleTab,
          tabs: <Widget>[
            Tab(text: "Bichos"),
            Tab(text: "Números"),
            Tab(text: "Vogais"),
          ],
        ),
      ),

      body: TabBarView(
        controller: _controleTab,
        children: <Widget>[
          TabBichos(),
          TabNumeros(),
          TabVogais()
        ],
      ),

    );
  }
}
