import './user.dart';

class Comment {
  User _user;
  String _message;

  Comment(this._user, this._message);

  User get user => _user;
  String get message => _message;
}