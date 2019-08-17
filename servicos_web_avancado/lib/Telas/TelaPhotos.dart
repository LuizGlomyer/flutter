import 'package:flutter/material.dart';

import 'package:servicos_web_avancado/Estruturas/Photo.dart';
import 'package:servicos_web_avancado/Telas/TelaErro.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class TelaPhotos extends StatefulWidget {
  @override
  _TelaPhotosState createState() => _TelaPhotosState();
}

class _TelaPhotosState extends State<TelaPhotos> {

  Future<List<Photo>> _recuperarPhotos() async {
    String url = "https://jsonplaceholder.typicode.com/photos";
    http.Response resposta = await http.get(url);
    var dadosJson = json.decode(resposta.body);
    List<Photo> fotos = List();

    int n = 0;
    for(var photo in dadosJson){
      Photo p = Photo(photo["albumId"], photo["id"], photo["title"], photo["url"], photo["thumbUrl"]);
      fotos.add(p);
      if(n == 100)
        break;
      n++;
    }

    return fotos;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Requisição de photos"),
        backgroundColor: Colors.redAccent,
      ),

      body: FutureBuilder<List<Photo>>(
        future: _recuperarPhotos(),
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
                      List<Photo> lista = snapshot.data;
                      return ListTile(
                        title: Text("${lista[index].id}"),
                        subtitle: Text("${lista[index].title}"),
                        onTap: (){
                          showDialog(
                              context: context,
                              builder: (context){
                                return AlertDialog(
                                  title: Text("${lista[index].url}"),
                                  content: Image.network(lista[index].url),
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
