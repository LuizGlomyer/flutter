import 'package:flutter/material.dart';
import 'package:navegacao/TelaPrincipal.dart';
import 'package:navegacao/TelaSecundaria.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: "/", // barra é a rota inicial do próprio main
      routes: {
        "/secundaria" : (context) => TelaSecundaria(valor: "TELA POR ROTA CUSTOMIZADA"), // rota criada
        // outras rotas
      },
      home: TelaPrincipal(),
    )
  );
}

