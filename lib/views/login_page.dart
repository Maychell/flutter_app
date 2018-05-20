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
      return new Material(
        child: new Container(
          child: new Form(
            key: this._formKey,
            child: new ListView(
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(
                    hintText: 'email@example.com',
                    labelText: 'Email'
                  ),
                  validator: (val) => val.isEmpty? 'Email can\'t be empty.' : null,
                  onSaved: (value) => this._email = value,
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                    hintText: 'Password',
                    labelText: '****'
                  ),
                  validator: (val) => val.isEmpty? 'Password can\'t be empty.' : null,
                  onSaved: (value) => this._password = value,
                ),
                new RaisedButton(
                  onPressed: () => _submit(),
                  child: new Text('Login'),
                )
              ],
            ),
          ),
        )
      );
    }
}