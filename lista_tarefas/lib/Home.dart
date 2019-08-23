import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _listaTarefas = [];
  Map<String, dynamic> _ultimaTarefaRemovida = Map();

  TextEditingController _controleTarefa = TextEditingController();

  Future<File> _getFile() async { // pois o arquivo será retornado em um futuro
    final diretorio = await getApplicationDocumentsDirectory(); // retorna um objeto Directory
    return File("${diretorio.path}/dados.json"); // abre o arquivo
    //print(diretorio.path);
  }


  _salvarTarefa() async {
    String textoDigitado = _controleTarefa.text;
    _controleTarefa.text = "";
    Map<String, dynamic> tarefa = Map();

    tarefa["titulo"] = textoDigitado; // dados da tarefa
    tarefa["realizado"] = false;
    setState(() {
      _listaTarefas.add(tarefa);
    });

    _salvarArquivo();
  }

  _salvarArquivo() async {
    var arquivo = await _getFile();

    String dados = json.encode(_listaTarefas); // convertermos a nossa lista de tarefas para uma string json
    arquivo.writeAsString(dados); // o salvamento em si
  }

  _lerArquivo() async{ // retorna o arquivo em formato string
    try{
      final arquivo = await _getFile();
      return arquivo.readAsString(); // leitura do arquivo

    }catch(e){
      return null;
    }
  }

  @override
  void initState() { // construtor da classe
    super.initState();

    _lerArquivo().then( // pega o retorno da função e roda códigos logo após
            (dados){
          setState(() {
            _listaTarefas = json.decode(dados); // atualizamos os dados
          });
        }
    );
  }


  Widget criarItemLista(context, index){
    final item = _listaTarefas[index]["titulo"];
    String chave = DateTime.now().millisecondsSinceEpoch.toString(); // por algum motivo usar isto como chave tira o efeito de animação da checkbox
    return StatefulBuilder(
        builder: (context, setState){
          return Dismissible( // coloquei esta classe para voltar a animação das checkboxes
            key: Key(UniqueKey().toString()), // as chaves devem ser únicas, se não o dismissible apresenta erros ao usar a opção desfazer da snack bar
            direction: DismissDirection.endToStart, //
            onDismissed: (direction){

              _ultimaTarefaRemovida = _listaTarefas[index];
              _listaTarefas.removeAt(index);
              _salvarArquivo();
              print(_listaTarefas.toString());

              final snackbar = SnackBar( // importante notar que a snackbar fica dentro do método onDismissed
                //backgroundColor: Colors.green, // verde fica bom
                //duration: Duration(seconds: 2), // tempo de visibilidade
                  action: SnackBarAction(
                      label: "Desfazer",
                      onPressed: (){
                        setState(() {
                          _listaTarefas.insert(index, _ultimaTarefaRemovida);
                          _salvarArquivo();
                          print(_listaTarefas);
                        });
                      }
                  ),
                  content: Text("Tarefa removida")
              );

              Scaffold.of(context).showSnackBar(snackbar); // primeiro acessamos o scaffold da tela, então dizemos que queremos mostrar uma snackbar


            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            child: CheckboxListTile(
              title: Text(_listaTarefas[index]["titulo"]),
              value: _listaTarefas[index]["realizado"],
              onChanged: (valorAlterado){
                setState(() {
                  _listaTarefas[index]["realizado"] = valorAlterado;
                });
                _salvarArquivo();
              },
            ),
          );
        }
    );
  }






  @override
  Widget build(BuildContext context) {
    print("itens: " + _listaTarefas.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Lista de Tarefas"),
      ),

      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: _listaTarefas.length,
                  itemBuilder: criarItemLista // podemos criar um método ao invés de colocar uma função anônima
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
        onPressed: (){
          showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  title: Text("Adicionar tarefa"),
                  content: TextField(
                    autofocus: true,
                    controller: _controleTarefa,
                    //maxLines: 1, // para aumentar o tamanho da caixa de texto, ela aumenta gradualmente com o texto digitado
                    decoration: InputDecoration(
                        labelText: "Digite sua tarefa"
                    ),
                  ),
                  actions: <Widget>[ // botões da telinha
                    FlatButton(
                      child: Text("Cancelar"),
                      onPressed: (){ Navigator.pop(context); _controleTarefa.text = ""; }, // para fechar a tela
                    ),
                    FlatButton(
                      child: Text("Salvar"),
                      onPressed: (){
                        _salvarTarefa();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              }
          );
        },
      ),

    );
  }
}
