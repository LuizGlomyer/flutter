import 'package:servicos_web_avancado/Estruturas/Post.dart';
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
      //print("post: " + post["title"] );
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }

    return postagens;
  }

  _post() async { // envia objetos novos

    var corpo = json.encode( // transforma o objeto json em string, o que é necessário para a requisição post
      {
      "userId": 120,
      "id": null, // pois é gerado de forma automatica pelo sistema
      "title": "Título",
      "body": "Corpo da postagem"
     }


    );
    http.Response resposta = await http.post(
      _urlBase + "/posts",
      headers: { // cabeçalho, isto é informado na documentação da API
        "Content-type": "application/json; charset=UTF-8"
      },
      body: corpo
    );

    //print("resposta: ${resposta.statusCode}"); // código 201: criado
    //print("resposta: ${resposta.body}"); // retorna o próprio post
    if(resposta.statusCode == 201)
      print("Post realizado com sucesso");
    else
      print("Post falhou");

  }

  _put() async { // pega um objeto e o atualiza completamente
    var corpo = json.encode( // transforma o objeto json em string, o que é necessário para a requisição post
        {
          "userId": 120,
          "id": null, // pois é gerado de forma automatica pelo sistema
          "title": "Título alterado",
          "body": "Corpo da postagem alterado"
        }
    );
    http.Response resposta = await http.put(
        _urlBase + "/posts/2", // segundo comentario
        headers: { // cabeçalho, isto é informado na documentação da API
          "Content-type": "application/json; charset=UTF-8"
        },
        body: corpo
    );

    //print("resposta: ${resposta.statusCode}"); // código 200: OK
    //print("resposta: ${resposta.body}"); // retorna o próprio post alterado
    if(resposta.statusCode == 200)
      print("Put deu certo");
    else
      print("Put falhou");
  }

  _patch() async { // atualização parcial

    var corpo = json.encode( // transforma o objeto json em string, o que é necessário para a requisição post
        {
          "userId": 120,
          "body": null,
        }
    );
    http.Response resposta = await http.patch(
        _urlBase + "/posts/2", // segundo comentario
        headers: { // cabeçalho, isto é informado na documentação da API
          "Content-type": "application/json; charset=UTF-8"
        },
        body: corpo
    );

    //print("resposta: ${resposta.statusCode}"); // código 200: OK
    //print("resposta: ${resposta.body}"); // retorna o próprio post alterado
    if(resposta.statusCode == 200)
      print("Patch deu certo");
    else
      print("Patch falhou");

  }

  _delete() async {
    http.Response resposta = await http.delete(_urlBase + "/posts/2");
    //print("resposta: ${resposta.statusCode}"); // código 200: OK
    //print("resposta: ${resposta.body}"); // retorna o próprio post deletado, no caso, vazio
    if(resposta.statusCode == 200)
      print("Delete deu certo");
    else
      print("Delete falhou");

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço avançado"),
      ),

      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  child: Text("Salvar"),
                  onPressed: _post,
                ),
                RaisedButton(
                  child: Text("Atualizar"),
                  onPressed: _patch, // ou _put
                ),
                RaisedButton(
                  child: Text("Remover"),
                  onPressed: _delete,
                ),
              ],
            ),

            Expanded(
              child: FutureBuilder<List<Post>>(
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
            )

          ],
        ),
      ),
    );
  }
}
