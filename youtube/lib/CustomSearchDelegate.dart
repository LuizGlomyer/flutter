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
    print("Resultado: digitado " + query);
    return Container();
  }

}