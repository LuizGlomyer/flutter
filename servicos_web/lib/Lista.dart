import 'package:flutter/material.dart';


class Lista extends StatefulWidget {
  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {

  List _itens = [];

  void _carregarItens(){
    _itens = []; // temos que setar, porque de alguma forma o método é executado duas vezes e os itens são carregados duas vezes
    ///explicação: o hot reload acaba carregando este método outra vez
    for(int i = 0; i <= 10; i++){
      Map<String, dynamic> item = Map();
      item["titulo"] = "Título ${i} Aasdjaiosdj Aopjiopajsd Kaspdo";
      item["descricao"] = "Descrição ${i} Hjaiosdj Aopjiopajsd Kaspdo";
      _itens.add(item);
    }
    print('itens:' + _itens.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),

      body: Container(
        padding: EdgeInsets.all(0), // não necessita de padding nem de scroll
        child: ListView.builder( // necessita ser filho de um widget como scaffold
            itemCount: _itens.length, // quantidade de itens
            itemBuilder: (context, indice){ // ele que cria cada item presente na lista
              Map<String, dynamic> item = _itens[indice]; // o indice itera pelo valor informado no ItemCount, fazemos esse map para pegar cada item da lista anterior
              print("item: ${item["titulo"]}");

              return ListTile( // cada item dentro da lista
                onTap: (){
                  print("tap no indice: $indice");
                  showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog( // caixinha de texto flutuante que aparece após o gesto em um item da lista
                        title: Text("onTap"), // título da caixa
                        content: Text("Você apertou no índice de número $indice"), // o corpo do texto,
                        backgroundColor: Colors.tealAccent,
                        //titleTextStyle: TextStyle(color: Colors.white),
                        actions: <Widget>[ // define widges que produzem ações e ficam na parte inferior do alert
                          FlatButton( // mescla bem com a tela de alert
                            onPressed: (){ Navigator.pop(context); }, // ao aperta o flatbutton a tela não é fechada, dando um pop conseguimos
                            child: Text("Sim"),
                          ),
                          FlatButton( // mescla bem com a tela de alert
                            onPressed: (){ Navigator.pop(context); },
                            child: Text("Não"),
                          ),
                        ],
                      );
                    } // precisamos passar o context
                  );
                },
                onLongPress: (){
                  print("long press no indice: $indice");
                },
                title: Text(item["titulo"]),
                subtitle: Text(item["descricao"]),
              ); // necessário para o item builder
            }
        ),
      ),
    );
  }
}
