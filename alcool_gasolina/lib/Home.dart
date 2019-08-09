import 'package:flutter/material.dart';

bool _isNumeric(String str) {
  if(str == null) {
    print("RETORNO");
    return false;
  }
  return double.tryParse(str) != null;
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "Resultado";
  var _erroAlcool, _erroGasolina; // já começam null, não precisamos settar

  void calcular(){
    double _precoAlcool = double.tryParse(_controllerAlcool.text); // o tryParse retorna null caso não seja possível converter
    double _precoGasolina = double.tryParse(_controllerGasolina.text);
    bool _erro = false;

    if(_precoGasolina == null){
      setState(() {
        _erroGasolina = "Por favor insira um valor válido";
      }); // se os campos estiverem nulos ou não numéricos irá apresentar um erro
      _erro = true;
    }
    if(!_isNumeric(_controllerAlcool.text)) {
      setState(() {
        _erroAlcool = "Por favor insira um valor válido";
      }); // outra forma de fazer a validação
      _erro = true;
    }
    // o método onChanged retira o estado de erro do campo, pois seta as variáveis de erro como null caso haja alguma informação válida dentro dos campos

    if(_erro)
      return;


    setState(() {
      if(_precoAlcool / _precoGasolina >= 7)
          _textoResultado = "Use gasolina!";
      else
          _textoResultado = "Use álcool!";
    });
    _controllerGasolina.text = ""; // resetando os campos para eles ficarem vazios após o botão ser pressionado
    _controllerAlcool.text = ""; // controladores não precisam estar dentro de um setstate para ter o seu conteúdo ser atualizado na tela



    print("$_precoAlcool, $_precoGasolina");
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
                keyboardType: TextInputType.number,
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
                _textoResultado,
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
