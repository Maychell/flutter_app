import 'package:flutter/material.dart';

import '../model/candidate.dart';
import './tasks_list.dart';
import '../ui_components/task_card.dart';
import '../ui_components/comment_card.dart';

class CandidateDetails extends StatelessWidget {

  final Candidate _candidate;
  String _gravatarUrl;
  final String _baseGravatarUrl = 'https://www.gravatar.com/avatar/';

  CandidateDetails(this._candidate) {
    _gravatarUrl = _baseGravatarUrl + _candidate.emailMd5;
  }

  @override
  Widget build(BuildContext context) {
    Widget candidateAvatar = new Image.network(
      _gravatarUrl,
      width: 90.0,
      height: 90.0,
      fit: BoxFit.cover,
    );

    Widget tasksSection = new Container(
      child: new Row(
        children: <Widget>[
          new Text('4.5'),
          new Column(
            children: <Widget>[
              new Text('English: 5.0'),
              new Text('English: 5.0'),
              new Text('English: 5.0'),
              new Text('English: 5.0'),
              new Text('English: 5.0')
            ],
          ),
        ],
      )
//      width: 400.0,
//      height: 200.0,
//      padding: const EdgeInsets.all(4.0),
//      child: new TasksList(_candidate.tasks)
    );

    Widget commentsSection = new Container(
      width: 500.0,
      height: 300.0,
      child: new ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
        new CommentCard(_candidate.comments[index]),
        itemCount: _candidate.comments.length,
      ),
    );

    Widget other = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
          _candidate.comments.first.message+_candidate.comments.first.message+_candidate.comments.first.message+_candidate.comments.first.message+_candidate.comments.first.message+_candidate.comments.first.message,
          softWrap: true
      )
//                          _candidate.comments.first.message
    );

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('RecruitX')
      ),
      body: new ListView(
        padding: const EdgeInsets.all(5.0),
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  candidateAvatar,
                  new Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(_candidate.name, style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                        tasksSection,
                      ],
                    )
                  )
                ],
              ),
              new Padding(padding: const EdgeInsets.only(top: 8.0)),
              commentsSection,
              other
            ],
          )
        ],
      ),
    );
  }
}
