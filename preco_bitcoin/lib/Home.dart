import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Image.asset("img/bitcoin.png"),
          
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Text(
              "Clique para verificar o valor",
              style: TextStyle(
                fontSize: 32
              ),
            ),
          ),
          
          RaisedButton(
            color: Colors.orange,
            child: Text("Atualizar"),
          )
          
        ],
      ),
    );
  }
}
