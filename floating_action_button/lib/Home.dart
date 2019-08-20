import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Floating action button"),
      ),

      body: Text("teste"),

      /*
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        foregroundColor: Colors.black, // cor do child
        // mini: true, // reduz o tamanho do botão pela metade
        child: Icon(Icons.add), // o que aparece dentro
        onPressed: (){
          print("pressionado");
        },
      ),
      */

      floatingActionButton: FloatingActionButton.extended( // um botão com mais opções, incluindo a de por uma label do lado de um ícone
        backgroundColor: Colors.red, //
        foregroundColor: Colors.white, // cor do child
        icon: Icon(Icons.add_shopping_cart),
        label: Text("Adicionar"),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(20) // valores interessão são 8 e 20
        ),
        onPressed: (){},
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // local do botão

      bottomNavigationBar: BottomAppBar(
        //shape: CircularNotchedRectangle(), // dá um efeito de corte na appbar, se usado em conjunto com um botão docked. Não fica legal com botões extended
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}
