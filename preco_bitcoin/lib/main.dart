import 'package:flutter/material.dart';
import 'package:preco_bitcoin/Home.dart';

import 'package:flutter/services.dart'; // para tirar a status bar e a barra de navegação

void main() {
    SystemChrome.setEnabledSystemUIOverlays([]); // retira as áreas
    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values); // as mostra novamente

    runApp(
      MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
      )
    );
}