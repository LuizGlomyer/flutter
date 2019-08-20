import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/Video.dart';



const CHAVE_YOUTUBE_API = "AIzaSyBiiZeJ9UiDDxPrEwUH2hjsw__klclU9-E";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api{

  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response resposta = await http.get(
      URL_BASE + "search"
          "?part=snippet" // ? para o primeiro parâmetro
          "&type=video" // & para parâmetros subsequentes
          "&maxResults=20"
          "&order=date"
          "&key=$CHAVE_YOUTUBE_API" // o parâmetro chave é obrigatório para a requisição
       //   "&channelId=$ID_CANAL"
          "&q=$pesquisa" // query, ou pesquisa
    );

    if(resposta.statusCode == 200){
      Map<String, dynamic> dadosJson = json.decode(resposta.body);
      /*
      print("titulo do video: " + dadosJson["items"][0]["snippet"]["title"]);
      print("resultado: " + dadosJson["pageInfo"].toString());*/

      List<Video> videos = dadosJson["items"].map<Video>( // o método map vai percorrer cada um dos objetos que estão dentro de "items"
          (map){
            return Video.fromJson(map);
          }
      ).toList();

      for(var video in videos){
        print("Resultado: " + video.titulo);
      }


      return videos;

    }

  }

}