import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  TextEditingController _textEditingController = TextEditingController(); // necessário para por no controller do TextField

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),

      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(32),
            child: TextField( // entrada de texto
              keyboardType: TextInputType.datetime, // tipo de teclado a ser utilizado
              obscureText: true, // esconde o texto, útil para senhas
              decoration: InputDecoration(
                labelText: "Digite um valor", // instrução que fica acima do campo a ser digitado
                helperText: "Escreva acima", // instrução que fica abaixo do campo a ser digitado
                hintText: "Escreva aqui", // instrução que fica dentro do campo a ser digitado
              ),
              enabled: true, // se o campo é ou não clicável para edição
              maxLength: 10, // número máximo de caracteres
              maxLengthEnforced: true, // desativado ele permite digitar caracteres além da quantidade estabelecida em maxLenght, só que o campo ficará vermeho, sinalizando erro
              style: TextStyle(color: Colors.amber, fontSize: 25), // estilo do texto interno

              onChanged: (String s){ // função anônica que captura o que é digitado
                print("Valor digitado: " + s);
              },
              onSubmitted: (String s){ // função anônica que captura o que é digitado
                print("Valor confirmado: " + s);
              },
              controller: _textEditingController, // serve para recuperar o texto em situações onde não estejamos trabalhando com os métodos onChanged, on Submited, etc
            ),
          ),

          RaisedButton(
            child: Text("Salvar"),
            color: Colors.lightGreen,
            onPressed: (){
              print("Texto recuperado: " + _textEditingController.text);
            },
          )
        ]
      ),

      bottomNavigationBar: Container(
        color: Colors.blueGrey,
        child: Text(
          "entrada de dados",
          style: TextStyle(
              backgroundColor: Colors.lightGreenAccent),
              textAlign: TextAlign.center,
        ),
      )
    );
  }
}
