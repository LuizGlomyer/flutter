//models são as classes que modelam o nosso sistema

class Video{

  String id;
  String titulo;
  String descricao;
  String imagem;
  String canal;


  Video({this.id, this.titulo, this.canal, this.descricao, this.imagem});

  ///ineficiente?
  /*
  static converterJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelId"];
    );
  } */

  factory Video.fromJson(Map<String, dynamic> json){ // retorna uma única instância?
    return Video(
        id: json["id"]["videoId"],
        titulo: json["snippet"]["title"],
        imagem: json["snippet"]["thumbnails"]["high"]["url"],
        canal: json["snippet"]["channelId"]
    );
  }




}