import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // para processar o JSON


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String info = "Informações";
  TextEditingController _controleCep = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço web"),
        backgroundColor: Colors.amberAccent,
      ),

      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              controller: _controleCep,
              decoration: InputDecoration(
                labelText: "Digite o cep. Ex: 01311300"
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20, bottom: 20)),
            RaisedButton(
              child: Text("Clique aqui"),
              onPressed: _recuperarCep,
            ),
            Padding(padding: EdgeInsets.only(bottom: 30)),
            Text(info),

          ],
        ),
      ),
    );
  }

  void _recuperarCep() async{ // devemos colocar o método como assíncronno
    String url = "http://viacep.com.br/ws/${_controleCep.text}/json/";
    http.Response resposta; // precisamos criar uma variável do tipo resposta
    resposta = await http.get(url); // devemos colocar o await pois vamos aguardar a execução
    print(resposta.statusCode.toString()); // é oc código de resposta http. Código 200 significa que deu tudo ok
    print(resposta.body); // o body é o retorno da requisição

    Map<String, dynamic> retorno = json.decode(resposta.body);
    setState(() {
      info = retorno.toString();
    });
  }

}
