

class Photo{

  Photo(this._albumId, this._id, this._title, this._url, this._thumbUrl);

  int _albumId;
  int _id;
  String _title;
  String _url;
  String _thumbUrl;


  ///getters setters
  int get albumId => _albumId;

  set albumId(int value) {
    _albumId = value;
  }

  int get id => _id;

  String get thumbUrl => _thumbUrl;

  set thumbUrl(String value) {
    _thumbUrl = value;
  }

  String get url => _url;

  set url(String value) {
    _url = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  set id(int value) {
    _id = value;
  }


}