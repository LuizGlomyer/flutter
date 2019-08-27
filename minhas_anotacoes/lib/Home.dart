import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controleTitulo = TextEditingController();
  TextEditingController _controleDescricao = TextEditingController();

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
                //todo salvamento
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
