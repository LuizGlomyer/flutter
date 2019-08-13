import 'package:flutter/material.dart';

import 'package:atm_consultoria/TelaEmpresa.dart';
import 'package:atm_consultoria/TelaServico.dart';
import 'package:atm_consultoria/TelaContato.dart';
import 'package:atm_consultoria/TelaCliente.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ATM Consultoria"),
        backgroundColor: Colors.green,
      ),

      body: Container(
        padding: EdgeInsets.all(36),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset("imagens/logo.png"),
              Container( // envolve as duas rows
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: _abrirEmpresa,
                          child: Image.asset("imagens/menu_empresa.png"),
                        ),
                        GestureDetector(
                          onTap: _abrirServico,
                          child: Image.asset("imagens/menu_servico.png"),
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        GestureDetector(
                          onTap: _abrirCliente,
                          child: Image.asset("imagens/menu_cliente.png"),
                        ),
                        GestureDetector(
                          onTap: _abrirContato,
                          child: Image.asset("imagens/menu_contato.png"),
                        )

                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  void _abrirCliente() { // funções para a navegação entre telas
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TelaCliente()
        )
    );
  }

  void _abrirContato() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TelaContato()
        )
    );
  }

  void _abrirEmpresa() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => TelaEmpresa()
      )
    );
  }

  void _abrirServico(){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TelaServico()
        )
    );
  }


}
