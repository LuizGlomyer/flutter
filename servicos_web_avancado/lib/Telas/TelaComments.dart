import 'package:flutter/material.dart';

import 'package:servicos_web_avancado/Estruturas/Comment.dart';
import 'TelaErro.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class TelaComments extends StatefulWidget {
  @override
  _TelaCommentsState createState() => _TelaCommentsState();
}

class _TelaCommentsState extends State<TelaComments> {

  Future<List<Comment>> _recuperarComments() async {
    String url = "https://jsonplaceholder.typicode.com/comments";
    http.Response resposta = await http.get(url);
    var dadosJson = json.decode(resposta.body);
    List<Comment> comentarios = List();

    for(var comment in dadosJson){
      Comment c = Comment(comment["postId"], comment["id"], comment["name"], comment["email"], comment["body"]);
      comentarios.add(c);
    }

    return comentarios;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Requisição de comments"),
        backgroundColor: Colors.redAccent,
      ),

      body: FutureBuilder<List<Comment>>(
        future: _recuperarComments(),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.active :
              break;
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(), // para exibir uma rodinha de carregamento enquanto o dado não é processado
              );
            case ConnectionState.done:
              if(!snapshot.hasError){ // se não tem erro
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index){
                      List<Comment> lista = snapshot.data;
                      return ListTile(
                        title: Text("$index - ${lista[index].email}"),
                        subtitle: Text("User id: ${lista[index].id}"),
                        onTap: (){
                          showDialog(
                              context: context,
                              builder: (context){
                                return AlertDialog(
                                  title: Text("${lista[index].email}"),
                                  content: Text("${lista[index].body}"),
                                );
                              }
                          );
                        },
                      );
                    }
                );
              }
              break;
          }

          return TelaErro();

        },
      ),

    );
  }
}
