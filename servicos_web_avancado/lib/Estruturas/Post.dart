class Post{

  Post(this._userId, this._id, this._title, this._body);

  int _userId;
  int _id;
  String _title;
  String _body;

  Map toJson(){
    return {
      "userId": this.userId,
      "id": this.id,
      "title": this.title,
      "body": this.body
    };
  }


  ///gettes e setters
  String get body => _body;

  set body(String value) {
    _body = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }
  ///fim getters e setters

}