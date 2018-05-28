import 'package:flutter/material.dart';

import './candidates_list.dart';

import '../model/user.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  void _submit() {
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save();

      final user = new User(10, 'Teste', _email);
      
      Navigator.of(context)
               .pushAndRemoveUntil(
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new CandidatesList(user)
                  ),
                  (Route route) => route == null
                );
    }
  }

  @override
    Widget build(BuildContext context) {
      final logo = new Hero(
        tag: 'logo',
        child: new CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: new Image.asset('images/codeminer-logo.png'),
        )
      );

      final email = new Padding(
        padding: new EdgeInsets.only(top: 15.0),
        child: new TextFormField(
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          validator: (val) => val.isEmpty? 'Email can\'t be empty.' : null,
          onSaved: (value) => this._email = value,
          decoration: new InputDecoration(
            hintText: 'Email',
            contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(32.0)
            )
          ),
        )
      );

      final password = new Padding(
        padding: new EdgeInsets.only(top: 15.0),
        child: new TextFormField(
          autofocus: false,
          obscureText: true,
          validator: (val) => val.isEmpty? 'Password can\'t be empty.' : null,
          onSaved: (value) => this._password = value,
          decoration: new InputDecoration(
            hintText: 'Password',
            contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(32.0)
            )
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
            color: Colors.greenAccent,
            child: new Text('Login', style: new TextStyle(color: Colors.white)),
            onPressed: () => _submit(),
          ),
        ),
      );

      final forgotPassword = new FlatButton(
        child: new Text('Forgot Password?', style: new TextStyle(color: Colors.white)),
        onPressed: () {}
      );

      return new Scaffold(
        backgroundColor: Colors.lightBlue[200],
        body: new Center(
          child: new Form(
            key: this._formKey,
            child: new Column(
              children: <Widget>[
                logo,
                email,
                password,
                loginButton,
                forgotPassword
              ],
            )
          )
        )
      );
    }
}