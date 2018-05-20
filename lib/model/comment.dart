import './user.dart';

class Comment {
  User _user;
  String _message;
  String _date;

  Comment(this._user, this._message, this._date);

  User get user => _user;
  String get message => _message;
  String get date => _date;
}