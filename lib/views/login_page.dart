import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './candidates_list.dart';

import '../model/user.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String _email;
  String _password;

  Future<User> _loginUser() async {
    final SharedPreferences prefs = await _prefs;
    final _user = new User(10, 'Teste', _email);

    prefs.setInt("id", _user.id);
    prefs.setString("email", _user.email);
    prefs.setString("name", _user.name);

    return _user;
  }

  void _submit() {
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save();

      _loginUser().then((user) {
        Navigator.of(context)
            .pushAndRemoveUntil(
            new MaterialPageRoute(
                builder: (BuildContext context) => new CandidatesList(user)
            ),
                (Route route) => route == null
        );
      });
    }
  }

  @override
    Widget build(BuildContext context) {
      final textPadding = new EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0);
      final contentPadding = new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0);
      final outlineCircularBorder = new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(32.0)
      );

      final logo = new Hero(
        tag: 'logo',
        child: new CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: new Image.asset('images/codeminer-logo.png'),
        )
      );

      final email = new Padding(
        padding: textPadding,
        child: new TextFormField(
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          validator: (val) => val.isEmpty? 'Email can\'t be empty.' : null,
          onSaved: (value) => this._email = value,
          decoration: new InputDecoration(
            hintText: 'Email',
            contentPadding: contentPadding,
            border: outlineCircularBorder
          ),
        )
      );

      final password = new Padding(
        padding: textPadding,
        child: new TextFormField(
          autofocus: false,
          obscureText: true,
          validator: (val) => val.isEmpty? 'Password can\'t be empty.' : null,
          onSaved: (value) => this._password = value,
          decoration: new InputDecoration(
            hintText: 'Password',
            contentPadding: contentPadding,
            border: outlineCircularBorder
          ),
        )
      );

      final loginButton = new Padding(
        padding: new EdgeInsets.symmetric(vertical: 16.0),
        child: new Material(
          borderRadius: new BorderRadius.circular(30.0),
          shadowColor: Colors.yellow,
          elevation: 5.0,
          child: new MaterialButton(
            minWidth: 200.0,
            height: 42.0,
            color: Colors.green,
            child: new Text('Login', style: new TextStyle(color: Colors.white)),
            onPressed: () => _submit(),
          ),
        ),
      );

      final forgotPassword = new FlatButton(
        child: new Text('Forgot Password?', style: new TextStyle(color: Colors.white)),
        onPressed: () {}
      );

      final body = new Form(
        key: this._formKey,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            logo,
            email,
            password,
            loginButton,
            forgotPassword
          ],
        )
      );

      return new Scaffold(
        backgroundColor: Colors.lightBlue[200],
        body: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: body
        )
      );
    }
}