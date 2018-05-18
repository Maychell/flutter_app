import 'package:flutter/material.dart';

import '../model/candidate.dart';
import '../views/candidate_details_2.dart';

class CandidateCard extends StatelessWidget {

  Candidate _candidate;
  String _gravatarUrl;
  String _baseGravatarUrl = 'https://www.gravatar.com/avatar/';

  CandidateCard(this._candidate) {
    _gravatarUrl = _baseGravatarUrl + _candidate.emailMd5;
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white70,
      child: new Card(
        child: new InkWell(
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new CandidateDetails2(_candidate))),
          child: new Row(
            children: <Widget>[
              new Padding(padding: const EdgeInsets.all(3.0)),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Image.network(
                    _gravatarUrl,
                    width: 90.0,
                    height: 90.0,
                    fit: BoxFit.cover,
                  )
                ],
              ),
              new Padding(
                padding: const EdgeInsets.only(left: 8.0),
              ),
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                    ),
                    new Text(
                      _candidate.name,
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0
                      ),
                    ),
                    new Text(
                      _candidate.fullCityName,
                      style: new TextStyle(color: Colors.grey[500]),
                    ),
                    new Container(
                      child: new Row(
                        children: <Widget>[
                          new Column(
                            children: <Widget>[
                              new Text(
                                _candidate.totalRate.toStringAsFixed(1),
                                style: new TextStyle(fontSize: 40.0),
                              )
                            ],
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                          ),
                          new Expanded(
                            child: new Column(
                              children: <Widget>[
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.star,
                                      color: Colors.yellow[700],

                                    ),
                                    new Icon(
                                      Icons.star,
                                      color: Colors.yellow[700],
                                    ),
                                    new Icon(
                                      Icons.star,
                                      color: Colors.yellow[700],
                                    ),
                                    new Icon(
                                      Icons.star,
                                      color: Colors.yellow[700],
                                    ),
                                    new Icon(
                                      Icons.star,
                                      color: Colors.yellow[700],
                                    )
                                  ],
                                ),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.person,
                                      color: Colors.grey[700],
                                      size: 16.0,
                                    ),
                                    new Padding(padding: const EdgeInsets.only(left: 2.0)),
                                    new Text(
                                      _candidate.reviewers.length.toString() + ' Reviewers',
                                      style: new TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 12.0
                                      ),
                                    ),
                                  ],
                                ),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.playlist_add_check,
                                      color: Colors.grey[700],
                                      size: 16.0,
                                    ),
                                    new Padding(padding: const EdgeInsets.only(left: 5.0)),
                                    new Text(
                                      _candidate.completedTask.length.toString() + '/' + _candidate.tasks.length.toString() + ' completed',
                                      style: new TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 12.0
                                      ),
                                    ),
                                  ],
                                ),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.message,
                                      color: Colors.grey[700],
                                      size: 16.0,
                                    ),
                                    new Padding(padding: const EdgeInsets.only(left: 5.0)),
                                    new Text(
                                      _candidate.comments.length.toString() + ' comments',
                                      style: new TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 12.0
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
