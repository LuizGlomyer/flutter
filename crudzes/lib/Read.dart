import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';


class Read extends StatefulWidget {
  @override
  _ReadState createState() => _ReadState();
}

class _ReadState extends State<Read> {
  List _dados = [];

  Future<File> _getFile() async { // pois o arquivo será retornado em um futuro
    final diretorio = await getApplicationDocumentsDirectory(); // retorna um objeto Directory
    return File("${diretorio.path}/dados.json"); // abre o arquivo
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
        backgroundColor: Colors.green,
        title: Text("Read"),
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
                        title: Text(_dados[index]["titulo"]),
                        content: Text(
                            "Atributo 1: ${_dados[index]["atrib1"]}\n"
                                "Atributo 2: ${_dados[index]["atrib2"]}\n"
                                "Atributo 3: ${_dados[index]["atrib3"]}\n"
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Voltar"),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          )
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
