import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Home(),
  )
);



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _lista = ["AAA", "BBB", "CCC", "DDD"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets"),
      ),

      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _lista.length,
              itemBuilder: (context, index){
                final item = _lista[index];
                return Dismissible(
                  background: Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.edit,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  secondaryBackground: Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.delete,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  direction: DismissDirection.horizontal, // podemos colocar apenas uma direção ou ambas, se ambas podemos usar um secondaryBackground
                  onDismissed: (direction){ // executa após o dismiss

                    if(direction == DismissDirection.startToEnd) // pegamos a direção e aplicamos o processamento adequado
                      print("Esquerda p/ direitra");
                    if(direction == DismissDirection.endToStart)
                      print("Direita p/ esquerda");

                    setState(() {
                      _lista.removeAt(index); // removemos o elemento que acabamos de dar o dismiss
                    });

                  },
                  key: Key(item), // indentifica cada elemento da lista
                  child: ListTile(
                    title: Text(item),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
