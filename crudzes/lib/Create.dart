import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';


class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {

  TextEditingController _controleTitulo = TextEditingController();
  TextEditingController _controleAtrib1 = TextEditingController();
  TextEditingController _controleAtrib2 = TextEditingController();
  TextEditingController _controleAtrib3 = TextEditingController();
  String _textoErro;
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
        backgroundColor: Colors.red,
        title: Text("Create"),
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
          child: Column(
            children: <Widget>[
              Text("Insira os dados abaixo"),
              TextField(
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

              Padding(padding: EdgeInsets.only(top: 20)),

              RaisedButton(
                child: Text("Salvar"),
                onPressed: (){

                  if(_controleTitulo.text == "" || _controleAtrib1.text == ""
                  || _controleAtrib2.text == "" || _controleAtrib3.text == ""){
                    setState(() {
                      _textoErro = "Por favor, insira todos os campos";
                    });
                    return;
                  }

                  Map<String, dynamic> entrada = Map();
                  entrada["titulo"] = _controleTitulo.text;
                  entrada["atrib1"] = _controleAtrib1.text;
                  entrada["atrib2"] = _controleAtrib2.text;
                  entrada["atrib3"] = _controleAtrib3.text;
                  _dados.add(entrada);
                  _salvarArquivo();

                  _controleTitulo.text = "";
                  _controleAtrib1.text = "";
                  _controleAtrib2.text = "";
                  _controleAtrib3.text = "";
                  setState(() {
                    _textoErro = null;
                  });
                },
              )


            ],
          ),
        ),
      )
    );
  }
}
