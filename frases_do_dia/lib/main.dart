import "package:flutter/material.dart";

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // tira a tarja de  debug
    title: "Frases do dia", // nome do app
    home: Container( // usamos containers para o conteúdo não extrapolar a tela. São como divs
      //color: Colors.green, // podemos colocar a color aqui fora, caso não haja conflito com uma boxdecoration
      padding: EdgeInsets.all(10), // para usar valores personalizados usar LTRB ao invés de all, valor de left, top etc, // também podemos usar o widget Padding(padding: , child:) e aplicar o padding apenas ao objeto filho
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(width: 5, color: Colors.white),
        color: Colors.green,
      ),
      child: Column( // é apenas UM filho, um unico objeto
        // mainAxisAlignment: MainAxisAlignment.center, //define onde o conteúdo fica alocado, .start e .end para o começo e fim da estrutura, respectivamente .center no centro // .space para alinhar uniformemente
        children: <Widget>[ // vários filhos
          Text( // primeiro vem os dados, depois os params opicionais
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eget tellus hendrerit.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.normal,
                letterSpacing: 0,
                wordSpacing: 10,
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.black,
                decorationStyle: TextDecorationStyle.wavy,
                backgroundColor: Colors.blueGrey
              )
          ),
          FlatButton(
              onPressed: (){
                print("Botão pressionado");
              }, //definimos uma função que será executada ao clicar, podemos usar uma função anônima
              color: Colors.red,
              child: Text( //child de um botão é onde iremos clicar
                  "Botão",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.lightBlueAccent,
                    decoration: TextDecoration.none
                  )
              ),
          ),
          FlatButton(
              onPressed: (){},
              child: Icon(Icons.attach_file, color: Colors.white),
              color: Colors.black54
          ),
          Image.asset( //para usar .asset devemos primeiro configurar as imagens no arquivo pubspec.yaml
            "images/parque.jpg",
            fit: BoxFit.cover, //fit define como a imagem se ajustará à tela
          ),
        ],
      )
    ), //containers agem como div
  ));
}