import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Futuro extends StatefulWidget {
  @override
  _FuturoState createState() => _FuturoState();
}

class _FuturoState extends State<Futuro> {

  Future<Map> _recuperarPreco() async { // com o future conseguimos ter um controle maior sobre a requisição, incluindo o seu status (done, etc)
    String url = "https://blockchain.info/ticker";
    http.Response resposta = await http.get(url);
    return json.decode(resposta.body);
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>( // necessário para capturar o futuro, ou seja, dados que ainda iremos recuperar
      future: _recuperarPreco(), // esse método é meio que executado várias vezes, por ser assíncrono, então ele pega os vários estados da conexão
      builder: (context, snapshot){ // snapshot são os dados qeu serão recuperados ao fazer a requisição
        //snapshot.data são os dados passados, do tipo Map
        String resultado;
        switch(snapshot.connectionState){ // fazemos um controle da conexão

          case ConnectionState.none : // estado de conexão nulo
            print("conexao none");
            break;

          case ConnectionState.active : // não iremos utilizar nem none nem active, mas o switch nos obriga a colocar os seus cases
            print("conexao active");
            break;

          case ConnectionState.waiting : // a conexão passa pelo estado de espera, essa é uma ótima oportunidade para definir uma tela de carregamento
            print("conexao waiting"); // afinal, podemos colocar o return da tela dentro de um case
            resultado = "Carregando";
            break;

          case ConnectionState.done :
            print("conexao done");
            if(snapshot.hasError) // devemos testar se não existem erros após a conexão ter sido realizada
              resultado = "Erro em carregar os dados";
            else {

              double valor = snapshot.data["BRL"]["buy"];
              resultado = "Preço do bitcoin: ${valor.toString()} ";

            }

            break;
        }

        return Center( // retorna a nossa tela em si
          child: Text(resultado),
        );

      },
    );
  }
}
