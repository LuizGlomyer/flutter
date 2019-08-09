import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  var _erroAlcool, _erroGasolina; // já começam null, não precisamos settar

  void calcular(){
    double precoAlcool = double.tryParse(_controllerAlcool.text); // o tryParse retorna null caso não seja possível converter
    double precoGasolina = double.tryParse(_controllerGasolina.text);

    if(precoAlcool == null) setState(() {  _erroAlcool = "Por favor insira um valor";  }); // se os campos estiverem nulos irá apresentar um erro
    if(precoGasolina == null) setState(() {  _erroGasolina = "Por favor insira um valor";  }); // o método onChanged retira o estado de erro do campo, pois seta as variáveis de erro como null caso haja alguma coisa dentro dos campos

    print("$precoAlcool, $precoGasolina");
  }

  bool contemVirgula(String s){
    for(int i = 0; i < s.length; i++)
      if(s[i] == ",")
        return true;
    return false;
  }

  verificacao(String value, String tipo) {
    print(tipo);

    if (contemVirgula(value) && tipo == "a") {
      setState(() {
        _erroAlcool = "Por favor, utilize ponto no lugar de vírgula";
      });
      return;
    }

    if (contemVirgula(value) && tipo == "g") {
      setState(() {
        _erroGasolina = "Por favor, utilize ponto no lugar de vírgula";
      });
      return;
    }

    if (!contemVirgula(value) && tipo == "a") {
      setState(() {
        _erroAlcool = null;
      });
      return;
    }

    if (!contemVirgula(value) && tipo == "g") {
      setState(() {
        _erroGasolina = null;
      });
      return;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),

      body: SingleChildScrollView( // se não colocássemos um scroll o teclado cobriria o conteúdo, ele ajusta a tela de acordo com o campo de input clicado
        child: Container(
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
                keyboardType: TextInputType.text,
                controller: _controllerAlcool,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Preço do Álcool, ex: 1.59",
                  errorText: _erroAlcool
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                onChanged: (String s) => verificacao(s, "a"), // s já define o que está dentro do campo, então fazermos a função anônima (String s) receber a função de tratamento
              ),

              TextField(
                keyboardType: TextInputType.text,
                controller: _controllerGasolina,
                decoration: InputDecoration(
                    labelText: "Preço da Gasolina, ex: 3.15",
                    errorText: _erroGasolina
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                onChanged: (String s) => verificacao(s, "g"),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  splashColor: Colors.lightBlueAccent,
                  onPressed: calcular,
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
      ),
    );
  }
}
