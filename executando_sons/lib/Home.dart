import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "audio/"); // prefix define o diretorio padrão dos audios

  _executar() async {
    /*
    String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3";
    int resultado = await audioPlayer.play(url);
    print(resultado);
    if (resultado == 1){
      //sucesso
    }*/

    audioPlayer = await audioCache.play("musica.mp3");
  }

  @override
  Widget build(BuildContext context) {
    _executar();
    return Scaffold(
      appBar: AppBar(
        title: Text("Executando sons"),
      ),

      body: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}
