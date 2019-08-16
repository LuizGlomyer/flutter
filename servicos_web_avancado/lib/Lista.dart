import 'package:servicos_web_avancado/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';




class Lista extends StatefulWidget {
  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {

  String _urlBase = "https://jsonplaceholder.typicode.com"; // MUITO CUIDADO pra url não terminar com /, se não dá erro e não conseguimos capturar os valores
  Future<List<Post>>_recuperarPostagens() async { // vamos retornar, ao invés de um Map, uma lista de objetos do tipo Post, criado por nós
    http.Response resposta = await http.get(_urlBase + "/posts");
    var dadosJson = json.decode(resposta.body); // pegamos um json cheio de postagens
    List<Post> postagens = List();

    for(var post in dadosJson){ // processamos cada postagem para colocarmos em uma lista
      print("post: " + post["title"] );
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }

    return postagens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço avançado"),
      ),

      body: FutureBuilder<List<Post>>(
        future: _recuperarPostagens(),
        builder: (context, snapshot){ // snapshot é do tipo List<Post>

          switch(snapshot.connectionState){

            case ConnectionState.none :

            case ConnectionState.active :

            case ConnectionState.waiting :
              print("conexao waiting");
              return Center(
                child: CircularProgressIndicator(), // para exibir uma rodinha de carregamento enquanto o dado não é processado
              );

            case ConnectionState.done :
              print("conexao done");
              if(snapshot.hasError)
                print("Erro ao carrgar lista");
              else{
                print("lista: carregou");
                // o retorno é o que aparecerá no body do scaffold
                return ListView.builder( // aparentemente devemos sempre usar objetos iterativos para capturar os dados numa listview
                    itemCount: snapshot.data.length, // quantidade de postagens
                    itemBuilder: (context, index){

                      List<Post> lista = snapshot.data;
                      Post p = snapshot.data[index]; // afinal, snapshot.data é uma lista e index se refere à posição onde estamos
                      return ListTile(
                        title: Text("${p.id.toString()}  ${p.title}"),
                        subtitle: Text(p.body),
                      );
                    }
                );
              }
          }

          return Center( // o FutureBuilder (ou pelo menos a IDE) sugere que tenha um retorno. Este retorno é o retorno de erro
            child: Text(
                "Erro de conexão",
              style: TextStyle(
                fontSize: 40,
                color: Colors.red
              ),
            ),
          );

        },
      ),
    );
  }
}
