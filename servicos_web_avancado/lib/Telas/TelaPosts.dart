import 'package:flutter/material.dart';

import 'package:servicos_web_avancado/Estruturas/Post.dart';
import 'TelaErro.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TelaPosts extends StatefulWidget {
  @override
  _TelaPostsState createState() => _TelaPostsState();
}

class _TelaPostsState extends State<TelaPosts> {

  Future<List<Post>> _recuperarPosts() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    http.Response resposta = await http.get(url);
    var dadosJson = json.decode(resposta.body);
    List<Post> postagens = List();

    for(var post in dadosJson){
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }

    return postagens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Requisição de posts"),
        backgroundColor: Colors.redAccent,
      ),

      body: FutureBuilder<List<Post>>(
        future: _recuperarPosts(),
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
                      List<Post> lista = snapshot.data;
                      return ListTile(
                        title: Text("$index - ${lista[index].title}"),
                        subtitle: Text("User id: ${lista[index].userId}"),
                        onTap: (){
                          showDialog(
                              context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text("${lista[index].id}"),
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
