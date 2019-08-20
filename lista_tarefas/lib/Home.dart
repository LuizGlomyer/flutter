import 'package:flutter/material.dart';




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _listaTarefas = ["kek", "cuck","lol"];

  @override
  Widget build(BuildContext context) {
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
                    title: Text(_listaTarefas[index]),
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
                  decoration: InputDecoration(

                  ),
                ),
              );
            }
          );
        },
      ),

    );
  }
}
