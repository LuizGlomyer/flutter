import 'package:flutter/material.dart';

import 'TelaPrincipal.dart';


class TelaSecundaria extends StatefulWidget {
  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {



  @override

  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Tela secundária "),
        backgroundColor: Colors.purple,
      ),

      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Primeira Tela"),
              padding: EdgeInsets.all(15),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaPrincipal())
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
