import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("videos/exemplo.mp4")
      ..setLooping(true)
      ..initialize().then((_) {
        // passar um parâmetro é obrigatório, mas usando _ passamos um argumento vazio o qual não aloca memória
        setState(() {
          // precisamos do set state para mostrar o primeiro frame do vídeo antes mesmo dele ser executado
          //_controller.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.initialized
            ? AspectRatio(
                // define uma área com base no aspect ratio do dispositivo
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Text("Pressione play"),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow
        ),
        onPressed: (){
          setState(() {
            _controller.value.isPlaying ? _controller.pause(): _controller.play() ;
          });
        },
      ),

    );
  }
}
