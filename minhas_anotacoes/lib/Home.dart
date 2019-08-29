import 'package:flutter/material.dart';

import 'helper/AnotacaoHelper.dart';
import 'model/Anotacao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controleTitulo = TextEditingController();
  TextEditingController _controleDescricao = TextEditingController();
  var _db = AnotacaoHelper();

  _exibirTelaCadastro(){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Adicionar anotação"),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancelar"),
            ),
            FlatButton(
              onPressed: (){
                _salvarAnotacao();
                Navigator.pop(context);
              },
              child: Text("Salvar"),
            ),
          ],
          content: Column(
            mainAxisSize: MainAxisSize.min, // útil para restringir o tamanho de uma coluna
            children: <Widget>[
              TextField(
                controller: _controleTitulo,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Título",
                  hintText: "Digite o título"
                ),
              ),
              TextField(
                controller: _controleDescricao,
                decoration: InputDecoration(
                    labelText: "Descrição",
                    hintText: "Digite a descrição"
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  _recuperarAnotacoes() async {
    List anotacoesRecuperadas = await _db.recuperarAnotacoes();
  }

  _salvarAnotacao() async{
    String titulo = _controleTitulo.text;
    String descricao = _controleDescricao.text;

    //print("data atual: " + DateTime.now().toString());
    Anotacao a = Anotacao(titulo, descricao, DateTime.now().toString());
    int resultado = await _db.salvarAnotacao(a);
    print("salvar anotação: " + resultado.toString());

    _controleTitulo.clear();
    _controleDescricao.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("Minhas anotações"),
      ),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: (){
          _exibirTelaCadastro();
        },
      ),
      
      body: Container(),
    );
  }
}
