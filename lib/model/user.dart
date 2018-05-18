import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;

class User {
  int _id;
  String _name;
  String _email;

  User(this._id, this._name, this._email);

  int get id => _id;
  String get name => _name;
  String get email => _email;

  String get emailMd5 {
    var content = new Utf8Encoder().convert(email);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}