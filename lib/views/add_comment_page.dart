import 'package:flutter/material.dart';

import '../model/comment.dart';
import '../model/user.dart';

class AddCommentPage extends StatefulWidget {

  User _user;

  AddCommentPage(this._user);

  @override
  State<StatefulWidget> createState() => new AddCommentPageState();
}

class AddCommentPageState extends State<AddCommentPage> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _message;

  void _submit() {
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save();
      var dateNow = new DateTime.now();
      String currentDate = dateNow.day.toString() + '/' + dateNow.month.toString() + '/' + dateNow.year.toString();

      final Comment comment = new Comment(widget._user, _message, currentDate);
      Navigator.pop(context, comment);
    }
  }

  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Create Candidate'),
        ),
        body: new Container(
          child: new Form(
            key: this._formKey,
            child: new ListView(
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(
                    hintText: 'Comment',
                    labelText: 'Comment'
                  ),
                  validator: (val) => val.isEmpty? 'Comment can\'t be empty.' : null,
                  onSaved: (value) => this._message = value,
                ),
                new Padding(padding: const EdgeInsets.only(top: 8.0)),
                new RaisedButton(
                  onPressed: () => _submit(),
                  child: new Text('Salvar'),
                )
              ]
            )
          )
        ),
      );
    }
}