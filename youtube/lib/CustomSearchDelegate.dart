import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {

  @override
  List<Widget> buildActions(BuildContext context) { // ações que ficam no lado direito
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = ""; // é como se fosse um controlador do campo de pesquisa, ele é configurado automaticamente
        },
      ),

      IconButton(
        icon: Icon(Icons.done),
        onPressed: (){
          buildResults(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back), // ação que fica no lado esquerdo, no caso, é um botão de voltar
      onPressed: (){
        close(context, ""); // o segundo parâmetro faz um retorno para a tela anterior
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //print("Resultado: pesquisa realizada");
    close(context, query); // retorna o que foi digitado
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) { // função que é executada a tecla digitada
    // print("Resultado: digitado " + query); // printa toda vez que uma nova letra é digitada
    List<String> lista = List();

    if(query.isNotEmpty){ // lista de sugestões
      lista = ["Android", "Android navegação", "Ios", "Jogos", "Flutter", "Aplicativos", "Desenvolvimento", "Informatica"].where( // where é como se fosse uma função lambda
          (texto) => texto.toLowerCase().startsWith(query.toLowerCase())
      ).toList(); // pois o retorno não é uma lista

      return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(lista[index]),
            onTap: (){
              close(context, lista[index]);
            },
          );
        },
      );

    }

    else{
      return Center(
        child: Text("Nenhum resultado para a pesquisa"), // aparece no body do scaffold
      );
    }

  }

}