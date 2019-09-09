import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class TabNumeros extends StatefulWidget {
  @override
  _TabNumerosState createState() => _TabNumerosState();
}

class _TabNumerosState extends State<TabNumeros> {

  AudioCache _audioCache = AudioCache(prefix: "audio/");

  _executar(String nomeAudio){
    _audioCache.play(nomeAudio + ".mp3");
  }

  @override
  void initState() {
    super.initState(); // como a execução é feita em cache, primeiro os arquivos são copiados para a memória e só depois são executados, gerando um delay
    _audioCache.loadAll([ // este método pré carrega os arquivos na memória
      "1.mp3", "2.mp3", "3.mp3",
      "4.mp3", "5.mp3", "6.mp3"
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // número de colunas que desejamos criar
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2, // define como o conteúdo irá se acomodar dentro da tela
      children: <Widget>[
        GestureDetector(
          onTap: (){
            _executar("1");
          },
          child: Image.asset("assets/img/1.png"),
        ),
        GestureDetector(
          onTap: (){
            _executar("2");
          },
          child: Image.asset("assets/img/2.png"),
        ),
        GestureDetector(
          onTap: (){
            _executar("3");
          },
          child: Image.asset("assets/img/3.png"),
        ),
        GestureDetector(
          onTap: (){
            _executar("4");
          },
          child: Image.asset("assets/img/4.png"),
        ),
        GestureDetector(
          onTap: (){
            _executar("5");
          },
          child: Image.asset("assets/img/5.png"),
        ),
        GestureDetector(
          onTap: (){
            _executar("6");
          },
          child: Image.asset("assets/img/6.png"),
        ),
      ],
    );
  }
}
