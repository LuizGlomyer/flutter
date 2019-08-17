import 'package:flutter/material.dart';
import 'package:servicos_web_avancado/Futuro.dart';
import 'package:servicos_web_avancado/Lista.dart';
import 'package:servicos_web_avancado/Home.dart';

import 'package:servicos_web_avancado/Telas/TelaPosts.dart';
import 'package:servicos_web_avancado/Telas/TelaComments.dart';
import 'package:servicos_web_avancado/Telas/TelaAlbums.dart';
import 'package:servicos_web_avancado/Telas/TelaPhotos.dart';


void main() => runApp(
  MaterialApp(
    initialRoute: "/",
    home: Home(), // Home() ou Lista()
    routes:{
      "/posts" : (context) => TelaPosts(),
      "/comments" : (context) => TelaComments(),
      "/albums" : (context) => TelaAlbums(),
      "/photos" : (context) => TelaPhotos()
    }
  )
);
