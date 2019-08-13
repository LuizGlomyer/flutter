import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

enum opcoesRadioButton{
  none,
  masculino,
  feminino,
  outro
}


class _CampoTextoState extends State<CampoTexto> {


  TextEditingController _textEditingController = TextEditingController(); // necessário para por no controller do TextField
  bool _checkBox = false, _checkBox2 = false;
  opcoesRadioButton _escolhaRadioButton = opcoesRadioButton.none;
  bool _switch = false;
  double _slider = 0;
  String _labelSlider = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),

      

      body: SingleChildScrollView(
        child: Column(
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
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 30),
                    child: Text("Comida brasileira"),
                  ),

                  Checkbox(
                    value: _checkBox, // valor inicial // quando clicamos, value representa o valor para o qual a variável vai mudar, ex: se estava desmarcado, mas apertamos, ele retorna o valor true
                    onChanged: (bool value){setState(() {  _checkBox = value;   }); }, // para mudar o estado do check box
                    checkColor: Colors.white,
                    activeColor: Colors.brown,
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text("Comida brasileira"),
              ),

              Checkbox(
                value: _checkBox, // valor inicial // quando clicamos, value representa o valor para o qual a variável vai mudar, ex: se estava desmarcado, mas apertamos, ele retorna o valor true
                onChanged: (bool value){setState(() {  _checkBox = value;   }); }, // para mudar o estado do check box
                checkColor: Colors.white,
                activeColor: Colors.brown,
              ),

              CheckboxListTile( // nesta classe o texto já vem imbutido, interessante notar que toda a sua extensão é clicável
                title: Text("Teste"),
                subtitle: Text("Subtítulo"),
                secondary: Icon(Icons.attach_file),
                activeColor: Colors.pink,
                selected: _checkBox2, // faz tod0 o resto ser destacado quando a checkbox é selecionada
                value: _checkBox2,
                onChanged: (bool value){setState(() {  _checkBox2 = value;   }); },
              ),

              Row(
                children: <Widget>[
                  Text("Masculino"),
                  Radio(
                    activeColor: Colors.blue,
                    value: opcoesRadioButton.masculino, // se refere ao valor da opção, cada opção possui um valor próprio
                    groupValue: _escolhaRadioButton, // existe apenas um group value, ele se refere ao único valor que será selecionado dentre todas as opções
                    onChanged: (opcoesRadioButton escolha){ // recebemos como parâmetro o que foi escolhido pelo usuário
                      setState(() {
                        _escolhaRadioButton = escolha;
                      });
                    },
                  ),
                  Text("Feminino"),
                  Radio(
                    activeColor: Colors.pinkAccent,
                    value: opcoesRadioButton.feminino,
                    groupValue: _escolhaRadioButton,
                    onChanged: (opcoesRadioButton escolha){ // recebemos como parâmetro o que foi escolhido pelo usuário
                      setState(() {
                        _escolhaRadioButton = escolha;
                      });
                    },
                  ),
                  Text("Outro"),
                  Radio(
                      activeColor: Colors.grey,
                      value: opcoesRadioButton.outro,
                      groupValue: _escolhaRadioButton,
                      onChanged: (opcoesRadioButton escolha){ // recebemos como parâmetro o que foi escolhido pelo usuário
                        setState(() {
                          _escolhaRadioButton = escolha;
                        });
                      }
                  ),
                ],
              ),

              Column(
                children: <Widget>[
                  RadioListTile( // notar que este e outros objetos com List no nome são listas, então devemos colocá-los obrigatoriamente dentro de uma coluna, caso coloquemos numa Row o conteúdo não vai aparecer
                    title: Text("Masculino"),
                    activeColor: Colors.blue,
                    value: opcoesRadioButton.masculino,
                    groupValue: _escolhaRadioButton,
                    onChanged: (opcoesRadioButton escolha){ // recebemos como parâmetro o que foi escolhido pelo usuário
                      setState(() {
                        _escolhaRadioButton = escolha;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Feminino"),
                    activeColor: Colors.pinkAccent,
                    value: opcoesRadioButton.feminino,
                    groupValue: _escolhaRadioButton,
                    onChanged: (opcoesRadioButton escolha){ // recebemos como parâmetro o que foi escolhido pelo usuário
                      setState(() {
                        _escolhaRadioButton = escolha;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Outro"),
                    activeColor: Colors.grey,
                    value: opcoesRadioButton.outro,
                    groupValue: _escolhaRadioButton,
                    onChanged: (opcoesRadioButton escolha){ // recebemos como parâmetro o que foi escolhido pelo usuário
                      setState(() {
                        _escolhaRadioButton = escolha;
                      });
                    },
                  ),

                  Switch( // muito parecido com checkbox
                    activeColor: Colors.amber,
                      activeTrackColor: Colors.brown,
                      value: _switch,
                      onChanged: (bool valor){
                        setState(() {
                          _switch = valor;
                        });
                      }
                  ),

                  SwitchListTile(
                    title: Text("Legenda"),
                    inactiveThumbColor: Colors.green,
                      inactiveTrackColor: Colors.deepPurpleAccent,
                      value: _switch,
                      onChanged: (bool valor){
                        setState(() {
                          _switch = valor;
                        });
                      }
                  ),

                  Slider(
                      min: 0, // limites superior e inferior
                      max: 100,
                      activeColor: Colors.green,
                      inactiveColor: Colors.orange,
                      label: _labelSlider, // informação que aparece ao deslizar o slider
                      divisions: 2000,
                      value: _slider,
                      onChanged: (double valor){
                        setState(() {
                          _slider = valor;
                          _labelSlider = "Valor selecionado: " + valor.toString();
                          print(valor);
                        });
                      }
                  )
                  
                ],
              )
            ]
        ),
      ),





      bottomNavigationBar: Container(
        color: Colors.blueGrey,
        child: Text(
          "entrada de dados",
          style: TextStyle(backgroundColor: Colors.lightGreenAccent),
          textAlign: TextAlign.center,
        ),
      )
    );
  }
}

