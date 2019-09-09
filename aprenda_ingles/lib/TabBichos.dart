import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class TabBichos extends StatefulWidget {
  @override
  _TabBichosState createState() => _TabBichosState();
}

class _TabBichosState extends State<TabBichos> {

  AudioCache _audioCache = AudioCache(prefix: "audio/");

  _executar(String nomeAudio) async {
    await _audioCache.play(nomeAudio + ".mp3");
  }

  @override
  void initState() {
    super.initState(); // como a execução é feita em cache, primeiro os arquivos são copiados para a memória e só depois são executados, gerando um delay
    _audioCache.loadAll([ // este método pré carrega os arquivos na memória
      "cao.mp3", "gato.mp3", "leao.mp3",
      "macaco.mp3", "ovelha.mp3", "vaca.mp3"
    ]);
  }


  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    //MediaQuery.of(context).size.aspectRatio

    return GridView.count(
      crossAxisCount: 2, // número de colunas que desejamos criar
      childAspectRatio: largura/altura * 2, // define como o conteúdo irá se acomodar dentro da tela
      children: <Widget>[
        GestureDetector(
          onTap: (){
            _executar("cao");
          },
          child: Image.asset("assets/img/cao.png"),
        ),
        GestureDetector(
          onTap: (){
            _executar("gato");
          },
          child: Image.asset("assets/img/gato.png"),
        ),
        GestureDetector(
          onTap: (){
            _executar("leao");
          },
          child: Image.asset("assets/img/leao.png"),
        ),
        GestureDetector(
          onTap: (){
            _executar("macaco");
          },
          child: Image.asset("assets/img/macaco.png"),
        ),
        GestureDetector(
          onTap: (){
            _executar("ovelha");
          },
          child: Image.asset("assets/img/ovelha.png"),
        ),
        GestureDetector(
          onTap: (){
            _executar("vaca");
          },
          child: Image.asset("assets/img/vaca.png"),
        ),
      ],
    );
  }
}
