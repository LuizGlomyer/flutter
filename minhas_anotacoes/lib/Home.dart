import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // para formatar a data
import 'package:intl/date_symbol_data_local.dart';

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
  List<Anotacao> _anotacoes = List<Anotacao>();

  _exibirTelaCadastro({Anotacao anotacao}){

    String textoAtualizarSalvar = "";
    if(anotacao == null){
      _controleDescricao.text = "";
      _controleTitulo.text = "";
      textoAtualizarSalvar = "Salvar";
    }
    else{
      _controleDescricao.text = anotacao.descricao;
      _controleTitulo.text = anotacao.titulo;
      textoAtualizarSalvar = "Atualizar";
    }

    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("$textoAtualizarSalvar anotação"),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancelar"),
            ),
            FlatButton(
              onPressed: (){
                _salvarAtualizarAnotacao(anotacao: anotacao);
                Navigator.pop(context);
              },
              child: Text("$textoAtualizarSalvar"),
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
    List<Anotacao> listaTemporaria = List<Anotacao>();
    for (var item in anotacoesRecuperadas){

      Anotacao anotacao = Anotacao.fromMap(item);
      listaTemporaria.add(anotacao);
    }

    setState(() {
      _anotacoes = listaTemporaria;
    });
    listaTemporaria = null;

    print("list anotações: " + anotacoesRecuperadas.toString());
  }

  _salvarAtualizarAnotacao({Anotacao anotacao}) async {
    String titulo = _controleTitulo.text;
    String descricao = _controleDescricao.text;

    if(anotacao == null){ // estamos salvando
      //print("data atual: " + DateTime.now().toString());
      Anotacao a = Anotacao(titulo, descricao, DateTime.now().toString());
      int resultado = await _db.salvarAnotacao(a);
      print("salvar anotação: " + resultado.toString());
    }
    else{ // atualizando
      anotacao.titulo = titulo;
      anotacao.descricao = descricao;
      anotacao.data = DateTime.now().toString();
      int resultado = await _db.atualizarAnotacao(anotacao);
    }

    _controleTitulo.clear();
    _controleDescricao.clear();
    _recuperarAnotacoes();
  }

  _formatarData(String data){
    initializeDateFormatting("pt_BR");
    //var formatador = DateFormat("dd/MM/y HH:mm:ss"); // essas letras são padrões da biblioteca
    var formatador = DateFormat.yMMMd("pt_BR");
    DateTime dataConvertida = DateTime.parse(data);
    String dataFormatada = formatador.format(dataConvertida);

    return dataFormatada;
  }


  @override
  void initState() {
    super.initState();
    _recuperarAnotacoes();

  }

  _removerAnotacao(int id) async {
    await _db.removerAnotacao(id);
    _recuperarAnotacoes();
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
      
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index){
                final anotacao = _anotacoes[index];
                return Card(
                  child: ListTile(
                    title: Text(anotacao.titulo),
                    subtitle: Text("${_formatarData(anotacao.data)} - ${anotacao.descricao}"),
                    trailing: Row( // útil para exibir ações na parte lateral
                      mainAxisSize: MainAxisSize.min, // se não tivesse isso a row ocuparia tod0 o espaço do card
                      children: <Widget>[
                        GestureDetector(
                          child: Icon(Icons.edit, color: Colors.green),
                          onTap: (){
                            _exibirTelaCadastro(anotacao: anotacao);
                          },
                        ),
                        Padding(padding: EdgeInsets.only(right: 16)),
                        GestureDetector(
                          child: Icon(Icons.remove_circle, color: Colors.red),
                          onTap: (){
                            _removerAnotacao(anotacao.id);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: _anotacoes.length,
            ),
          )
        ],
      ),
    );
  }
}
