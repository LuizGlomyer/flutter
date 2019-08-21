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

  Future<File> _getFile() async { // pois o arquivo será retornado em um futuro
    final diretorio = await getApplicationDocumentsDirectory(); // retorna um objeto Directory
    return File("${diretorio.path}/dados.json"); // abre o arquivo
    //print(diretorio.path);
  }

  _salvarArquivo() async {
    var arquivo = await _getFile();
    Map<String, dynamic> tarefa = Map();

    tarefa["titulo"] = "Ir ao mercado";
    tarefa["realizada"] = false;
    _listaTarefas.add(tarefa);

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

  @override
  Widget build(BuildContext context) {
    _salvarArquivo();
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
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(_listaTarefas[index]["titulo"]),
                    );
                  }
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
                    minLines: 1,
                    maxLines: 5, // para aumentar o tamanho da caixa de texto, ela aumenta gradualmente com o texto digitado
                    decoration: InputDecoration(
                        labelText: "Digite sua tarefa"
                    ),
                  ),
                  actions: <Widget>[ // botões da telinha
                    FlatButton(
                      child: Text("Cancelar"),
                      onPressed: (){ Navigator.pop(context); }, // para fechar a tela
                    ),
                    FlatButton(
                      child: Text("Salvar"),
                      onPressed: (){
                        //todo salvar
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
