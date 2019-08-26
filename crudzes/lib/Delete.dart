import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Delete extends StatefulWidget {
  @override
  _DeleteState createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {

  List _dados = [];

  Future<File> _getFile() async { // pois o arquivo será retornado em um futuro
    final diretorio = await getApplicationDocumentsDirectory(); // retorna um objeto Directory
    return File("${diretorio.path}/dados.json"); // abre o arquivo
  }

  _salvarArquivo() async {
    var arquivo = await _getFile();
    String dadosSalvar = json.encode(_dados);
    arquivo.writeAsString(dadosSalvar);
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
  void initState() { // construtor, devemos ler o arquivo por aqui
    super.initState();

    _lerArquivo().then( // pega o retorno da função e roda códigos logo após
            (dados){
          setState(() {
            _dados = json.decode(dados); // atualizamos os dados
            print(_dados);
          });
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Delete"),
      ),

      body: ListView.separated(
          itemCount: _dados.length,
          separatorBuilder: (context, index){
            return Divider(
              color: Colors.grey,
            );
          },
          itemBuilder: (context, index){
            return ListTile(
              title: Text(_dados[index]["titulo"]),
              onTap: (){
                showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text("Deseja mesmo deletar o item ${_dados[index]["titulo"]}?"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Sim"),
                            onPressed: (){
                              setState(() {
                                _dados.removeAt(index);
                              });
                              _salvarArquivo();
                              Navigator.pop(context);
                            },
                          ),
                          FlatButton(
                            child: Text("Não"),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    }
                );
              },
            );
          }
      ),
    );
  }
}
