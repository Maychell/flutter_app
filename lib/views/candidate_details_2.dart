import 'package:flutter/material.dart';

import '../ui_components/comment_card.dart';
import '../ui_components/task_card.dart';
import './add_comment_page.dart';
import '../model/candidate.dart';
import '../model/comment.dart';
import '../model/task.dart';
import '../model/user.dart';

class CandidateDetails2 extends StatefulWidget {

  final User _currentUser;
  Candidate candidate;
  String gravatarUrl;
  final String _baseGravatarUrl = 'https://www.gravatar.com/avatar/';

  CandidateDetails2(this.candidate, this._currentUser) {
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
  
  
  Widget candidateAvatar(url) => new Image.network(
    url,
    width: 90.0,
    height: 90.0,
    fit: BoxFit.cover,
  );
  
  Widget buildActionButton() {
    return new FloatingActionButton(
      backgroundColor: Colors.greenAccent,
      child: new Icon(Icons.add_comment, color: Colors.white),
      onPressed: () => _addComment(),
    );
  }

  void _addComment() async {
    final Comment comment = await Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new AddCommentPage(widget._currentUser)),
    );

    if (comment != null) {
      widget.candidate.comments.add(comment);

      setState(() {
        this.commentCardsSection = buildCommentCards();
      });
    }
  }

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
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                decoration: new BoxDecoration(
                  border: new Border(bottom: new BorderSide(color: Colors.grey[500]))
                ),
                child: new Row(
                  children: <Widget>[
                    candidateAvatar(widget.gravatarUrl),
                    new Padding(padding: const EdgeInsets.only(left: 8.0)),
                    new Expanded(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(widget.candidate.name, style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                          new Column(children: taskCardsSection),
                          new Padding(padding: const EdgeInsets.only(top: 8.0)),
                          new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    new Text(
                                      'TOTAL RATING',
                                      style: new TextStyle(fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              new Padding(padding: const EdgeInsets.all(3.0)),
                              new Text(
                                widget.candidate.totalRate.toString(),
                                style: new TextStyle(fontWeight: FontWeight.bold),
                              ),
                              new Padding(padding: const EdgeInsets.only(right: 20.0))
                            ],
                          ),
                          new RaisedButton(
                            color: Colors.greenAccent,
                            child: new Text(
                              'Add Review',
                              style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () => print('add review pressed'),
                          )
                        ],
                      )
                    )
                  ],
                )
              ),
              new Padding(padding: const EdgeInsets.only(top: 15.0)),
              new Column(children: commentCardsSection)
            ],
          )
        ],
      ),
      floatingActionButton: buildActionButton(),
    );
  }
}