import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _valorBitcoin = "Clique abaixo";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("img/bitcoin.png"),
          
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            child: Text(
              _valorBitcoin,
              style: TextStyle(
                fontSize: 25,
                color: Colors.black54,
                decoration: TextDecoration.none
              ),
            ),
          ),
          
          RaisedButton(
            color: Colors.orange,
            child: Text(
                "Atualizar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: _checarValor,
          )
          
        ],
      ),
    );
  }

  void _checarValor() async{
    String url = "https://blockchain.info/ticker";
    http.Response resposta = await http.get(url); // await faz a atribuição aguardar a requisição
    Map<String, dynamic> retorno = json.decode(resposta.body);
    print(retorno["BRL"]);

    setState(() {
      _valorBitcoin = "R\$ ${retorno["BRL"]["buy"]}";
    });

  }
}


