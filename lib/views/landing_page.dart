import 'package:flutter/material.dart';

import './candidates_list.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.greenAccent,
      child: new InkWell(
        onTap: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new CandidatesList()), (Route route) => route == null),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'RecruitX',
              style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),
            ),
            new Text(
              'Codeminer 42',
              style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )
    );
  }
}