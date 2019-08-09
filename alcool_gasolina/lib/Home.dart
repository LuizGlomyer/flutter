import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),

      body: Container(
        margin: EdgeInsets.fromLTRB(30, 40, 30, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // faz os filhos preencherem toda a coluna, no caso, foi útil para esticar o botão
          children: <Widget>[
            Image.asset("logo.png"),
            Padding(
              padding: EdgeInsets.only(top: 50, bottom: 0),
              child: Text(
                "Saiba qual a melhor opção para o abastecimento do seu carro",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ),
            ),

            TextField(
              keyboardType: TextInputType.number,
              controller: _controllerAlcool,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: "Preço do Álcool, ex: 1.59",
              ),
              style: TextStyle(
                  fontSize: 22
              ),
            ),

            TextField(
              keyboardType: TextInputType.number,
              controller: _controllerGasolina,
              decoration: InputDecoration(
                labelText: "Preço da Gasolina, ex: 3.15"
              ),
              style: TextStyle(
                fontSize: 22
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: (){},
                child: Text("Calcular", style: TextStyle(fontSize: 20)),
              ),
            ),

            Text(
              "Resultado",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
