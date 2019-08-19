import 'package:flutter/material.dart';

import 'package:youtube/Api.dart';
import 'package:youtube/model/Video.dart';


class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _listarVideos(){
    Api api = Api();
    return api.pesquisar("ios");
  }

  @override
  Widget build(BuildContext context) {




    return FutureBuilder<List<Video>>(
      future: _listarVideos(),
      builder: (context, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.active:
            break;
          case ConnectionState.none:
            break;
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            if(snapshot.hasData){ // se tem ou não tem dados

              return ListView.separated(
                  itemBuilder: null,
                  separatorBuilder: (context, index){

                  },
                  itemCount: snapshot.data.length
              );

            }
            else{
              return Center(
                child: Text("Nenhum dado a ser exibido"),
              );
            }
        }
        return Text();
      },
    );
  }
}
