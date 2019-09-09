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
  bool primeiraExecucao = true;
  double volume = 0.5;

  _executar() async {
    /*
    String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3";
    int resultado = await audioPlayer.play(url);
    print(resultado);
    if (resultado == 1){
      //sucesso
    }*/

    audioPlayer.setVolume(volume); // volume padrão ao fazer a execução
    if(primeiraExecucao){
      audioPlayer = await audioCache.play("musica.mp3"); // inicia o audio no início
      primeiraExecucao = false;
    }
    else{
      audioPlayer.resume(); // continua a partir do momento pausado
    }

  }

  _pausar() async {

    int resultado = await audioPlayer.pause();
    if(resultado == 1){
      //sucesso
    }

  }

  _parar() async {

    int resultado = await audioPlayer.stop();
    if(resultado == 1){
      //sucesso
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Executando sons"),
      ),

      body: Column(
        children: <Widget>[
          Slider(
            value: volume,
            min: 0,
            max: 1,
            divisions: 10,
            onChanged: (novoVolume){
              setState(() {
                volume = novoVolume;
              });
              audioPlayer.setVolume(novoVolume);
              
            },
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: (){
                    _executar();
                  },
                  child: Image.asset("assets/img/executar.png"),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: (){
                    _pausar();
                  },
                  child: Image.asset("assets/img/pausar.png"),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: (){
                    _parar();
                  },
                  child: Image.asset("assets/img/parar.png"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
