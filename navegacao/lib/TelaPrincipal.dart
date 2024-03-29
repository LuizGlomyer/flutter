import 'package:flutter/material.dart';
import 'package:navegacao/TelaSecundaria.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {

  TextEditingController _controleEntrada = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Tela principal"),
        backgroundColor: Colors.orange,
      ),

      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            TextField(controller: _controleEntrada),
            Padding(padding: EdgeInsets.only(top:10, bottom: 10)),
            RaisedButton(
              child: Text("Segunda Tela"),
              padding: EdgeInsets.all(15),
              onPressed: (){
                Navigator.push( //classe responsável pela mudança de tela. O método push abre uma nova tela por cima da tela atual
                    context, // o atual contexto do app
                    MaterialPageRoute( // a 'rota'
                        builder: (context) => TelaSecundaria(valor: _controleEntrada.text) // valor que queremos passar para a próxima tela
                    )
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(),
    );
  }
}
