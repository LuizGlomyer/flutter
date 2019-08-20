import 'package:flutter/material.dart';

import 'package:youtube/Api.dart';
import 'package:youtube/model/Video.dart';


class Inicio extends StatefulWidget {

  String pesquisa;
  Inicio(this.pesquisa);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _listarVideos(String pesquisa){
    Api api = Api();
    return api.pesquisar(pesquisa);
  }

  @override
  Widget build(BuildContext context) {




    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa),
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
                  itemBuilder: (context, index){

                    List<Video> videos = snapshot.data;
                    Video video = videos[index];
                    return Column(
                      children: <Widget>[
                        Container(
                          height: 190, // como a imagem fica de background, o container precisa de algo dentro para exibi-la
                          decoration: BoxDecoration(
                            image: DecorationImage( // background do container
                              fit: BoxFit.cover,
                                image: NetworkImage(video.imagem)
                            )
                          ),
                        ),

                        ListTile(
                          title: Text(video.titulo),
                          subtitle: Text(video.canal),
                        ),

                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Divider( // widget que serve como divisor entre itens da lista
                    height: 3,
                    color: Colors.grey,
                  ),
                  itemCount: snapshot.data.length
              );

            }
            else{
              return Center(
                child: Text("Nenhum dado a ser exibido"),
              );
            }
        }
        return Text("aaaa");
      },
    );
  }
}
