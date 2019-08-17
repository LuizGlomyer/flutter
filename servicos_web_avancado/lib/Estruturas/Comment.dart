class Comment{

  Comment(this._postId, this._id, this._name, this._email, this._body);

  int _postId;
  int _id;
  String  _name;
  String _email;
  String _body;

  ///GETTERS E SETTERS
  int get postId => _postId;

  set postId(int value) {
    _postId = value;
  }

  int get id => _id;

  String get body => _body;

  set body(String value) {
    _body = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  set id(int value) {
    _id = value;
  }


}