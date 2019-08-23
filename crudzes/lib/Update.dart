import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Update extends StatefulWidget {
  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {

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
        backgroundColor: Color.fromRGBO(255, 204, 0, 1),
        title: Text("Update"),
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
                      TextEditingController _controleTitulo = TextEditingController();
                      TextEditingController _controleAtrib1 = TextEditingController();
                      TextEditingController _controleAtrib2 = TextEditingController();
                      TextEditingController _controleAtrib3 = TextEditingController();
                      _controleTitulo.text = _dados[index]["titulo"];
                      _controleAtrib1.text = _dados[index]["atrib1"];
                      _controleAtrib2.text = _dados[index]["atrib2"];
                      _controleAtrib3.text = _dados[index]["atrib3"];
                      String _textoErro;
                      return SingleChildScrollView(
                        child: AlertDialog(
                          title: Text(_dados[index]["titulo"]),
                          content: Column(
                            children: <Widget>[
                              Text("Insira os dados abaixo"),
                              TextField(
                                onTap: (){
                                  setState(() {
                                    _controleTitulo.text = "";
                                  });
                                },
                                controller: _controleTitulo,
                                decoration: InputDecoration(
                                  labelText: "Título",
                                    errorText: _textoErro
                                ),
                                style: TextStyle(
                                  fontSize: 20
                                )
                              ),

                              Padding(
                                padding: EdgeInsets.only(top: 20, bottom: 20),
                              ),


                              TextField(
                                  controller: _controleAtrib1,
                                  decoration: InputDecoration(
                                      labelText: "Atributo 1"
                                  ),
                                  style: TextStyle(
                                      fontSize: 20
                                  )
                              ),
                              TextField(
                                  controller: _controleAtrib2,
                                  decoration: InputDecoration(
                                      labelText: "Atributo 2"
                                  ),
                                  style: TextStyle(
                                      fontSize: 20
                                  )
                              ),
                              TextField(
                                  controller: _controleAtrib3,
                                  decoration: InputDecoration(
                                      labelText: "Atributo 3"
                                  ),
                                  style: TextStyle(
                                      fontSize: 20
                                  )
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("Salvar"),
                              onPressed: (){
                                    //todo salvamento
                              },
                            ),

                            FlatButton(
                              child: Text("Cancelar"),
                              onPressed: (){
                                Navigator.pop(context);
                                _controleTitulo.text = "";
                                _controleAtrib1.text = "";
                                _controleAtrib2.text = "";
                                _controleAtrib3.text = "";
                                setState(() {
                                  _textoErro = null;
                                });
                              },
                            ),
                          ],
                        ),
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
