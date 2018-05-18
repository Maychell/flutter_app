import 'package:flutter/material.dart';

import '../ui_components/comment_card.dart';
import '../ui_components/task_card.dart';
import '../model/candidate.dart';
import '../model/comment.dart';
import '../model/task.dart';

class CandidateDetails2 extends StatefulWidget {

  Candidate candidate;
  String gravatarUrl;
  final String _baseGravatarUrl = 'https://www.gravatar.com/avatar/';

  CandidateDetails2(this.candidate) {
    gravatarUrl = _baseGravatarUrl + candidate.emailMd5;
  }

  @override
  State<StatefulWidget> createState() => new CandidateDetails2State();
}

class CandidateDetails2State extends State<CandidateDetails2> {

  List<CommentCard> commentCardsSection;
  List<TaskCard> taskCardsSection;

  @override
  void initState() {
    this.commentCardsSection = buildCommentCards();
    this.taskCardsSection = buildTaskCards();
    super.initState();
  }

  List<TaskCard> buildTaskCards() {
    return widget.candidate.tasks.map((Task t) => new TaskCard(t)).toList();
  }

  List<CommentCard> buildCommentCards() {
    return widget.candidate.comments.map((Comment c) => new CommentCard(c)).toList();
  }

//  Widget candidateAvatar = new Image.network(
//    widget.gravatarUrl,
//    width: 90.0,
//    height: 90.0,
//    fit: BoxFit.cover,
//  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Candidate Details'),
        ),
        body: new ListView(
          padding: new EdgeInsets.only(top: 8.0),
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Image.network(
                      widget.gravatarUrl,
                      width: 90.0,
                      height: 90.0,
                      fit: BoxFit.cover,
                    ),
                    new Expanded(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(widget.candidate.name, style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                            new Column(children: taskCardsSection == null ? [] : taskCardsSection)
                          ],
                        )
                    )
                  ],
                ),
                new Padding(padding: const EdgeInsets.only(top: 8.0)),
                new Column(children: commentCardsSection == null ? [] : commentCardsSection)
              ],
            )
          ],
        )
    );
  }
  //this.commentCards

}