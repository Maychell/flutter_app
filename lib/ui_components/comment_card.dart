import 'package:flutter/material.dart';

import '../model/comment.dart';

class CommentCard extends StatelessWidget {

  Comment _comment;
  String _gravatarUrl;
  final String _baseGravatarUrl = 'https://www.gravatar.com/avatar/';

  CommentCard(this._comment) {
    _gravatarUrl = _baseGravatarUrl + _comment.user.emailMd5;
  }

  @override
  Widget build(BuildContext context) {
    Widget userAvatar = new Image.network(
      _gravatarUrl,
      width: 60.0,
      height: 60.0,
      fit: BoxFit.cover,
    );

    return new Container(
      padding: const EdgeInsets.all(3.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          userAvatar,
          new Padding(padding: const EdgeInsets.only(left: 5.0)),
          new Flexible(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Text(_comment.user.name, style: new TextStyle(fontWeight: FontWeight.bold)),
                    new Padding(padding: const EdgeInsets.only(left: 3.0)),
                    new Text('said:')
                  ],
                ),
                new Text(_comment.message+_comment.message+_comment.message+_comment.message+_comment.message, softWrap: true,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}