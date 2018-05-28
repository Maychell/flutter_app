import 'package:flutter/material.dart';

import '../ui_components/comment_card.dart';
import '../ui_components/section_card.dart';
import './add_comment_page.dart';
import '../model/candidate.dart';
import '../model/comment.dart';
import '../model/section.dart';
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
  List<SectionCard> sectionCardsSection;

  @override
  void initState() {
    this.commentCardsSection = buildCommentCards();
    this.sectionCardsSection = buildSectionCards();
    super.initState();
  }

  List<SectionCard> buildSectionCards() {
    return widget.candidate.sections.map((Section s) => new SectionCard(s)).toList();
  }

  List<CommentCard> buildCommentCards() {
    return widget.candidate.comments.map((Comment c) => new CommentCard(c)).toList();
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
    final candidateAvatar = new Image.network(
      widget.gravatarUrl,
      width: 90.0,
      height: 90.0,
      fit: BoxFit.cover,
    );

    final profileInfo = new Row(
      children: <Widget>[
        candidateAvatar,
        new Padding(padding: const EdgeInsets.only(left: 8.0)),
        new Expanded(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(widget.candidate.name, style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              new Padding(padding: const EdgeInsets.only(top: 3.0)),
              new Text(widget.candidate.fullCityName, style: new TextStyle(color: Colors.grey[500])),
              new Padding(padding: const EdgeInsets.only(top: 3.0)),
              new Text(widget.candidate.email),
              new Padding(padding: const EdgeInsets.only(top: 8.0)),
              new Row(
                children: <Widget>[
                  new Text('Score:', style: new TextStyle(fontWeight: FontWeight.bold)),
                  new Padding(padding: const EdgeInsets.all(3.0)),
                  new Text(widget.candidate.totalRate.toString(), style: new TextStyle(fontWeight: FontWeight.bold)),
                  new Padding(padding: const EdgeInsets.only(right: 20.0))
                ],
              )
            ],
          )
        )
      ],
    );

    final actionButton = new FloatingActionButton(
      backgroundColor: Colors.greenAccent,
      child: new Icon(Icons.add_comment, color: Colors.white),
      onPressed: () => _addComment(),
    );

    final deviderLine = new BoxDecoration(border: new Border(top: new BorderSide(color: Colors.grey[500])));
    final contentMargin = const EdgeInsets.only(top: 7.0, left: 8.0, right: 8.0);
    final contentPadding = const EdgeInsets.only(top: 10.0, bottom: 5.0, left: 8.0, right: 8.0);

    final ratingSection = new Container(
      margin: contentMargin,
      padding: contentPadding,
      decoration: deviderLine,
      child: new Column(children: sectionCardsSection),
    );

    final commentsSection = new Container(
      margin: contentMargin,
      padding: contentPadding,
      decoration: deviderLine,
      child: new Column(children: commentCardsSection)
    );

    final headerStyle = new TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
      color: Colors.lightBlue
    );

    final ratingText = new Text('Rating', style: headerStyle);
    final commentText = new Text('Comments', style: headerStyle);

    final body = new ListView(
      padding: new EdgeInsets.only(top: 8.0),
      children: <Widget>[
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            profileInfo,
            new Padding(padding: const EdgeInsets.only(top: 15.0)),
            new Container(padding: contentMargin, child: ratingText),
            ratingSection,
            new Padding(padding: const EdgeInsets.only(top: 15.0)),
            new Container(padding: contentMargin, child: commentText),
            commentsSection
          ],
        )
      ],
    );

    return new Scaffold(
      appBar: new AppBar(title: new Text('Candidate Details')),
      body: body,
      floatingActionButton: actionButton,
    );
  }
}