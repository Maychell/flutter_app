import 'package:flutter/material.dart';

import '../ui_components/candidate_card.dart';
import '../model/candidate.dart';
import '../model/city.dart';
import '../model/comment.dart';
import '../model/user.dart';
import '../model/reviewer.dart';
import '../model/task.dart';
import '../model/rate.dart';
import './create_candidate.dart';

class CandidatesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new CandidatesListState();
}

class CandidatesListState extends State<CandidatesList> {
  List<Candidate> _candidates;

  @override
  void initState() {
    City city = new City(1, 'Natal', 'RN');
    User user = new User(10, 'Fulano', 'beau@dentedreality.com.au');
    List<Comment> comments = <Comment> [ new Comment(user, 'Muito ruim, gostei não'), new Comment(user, 'Muito ruim, gostei não'), new Comment(user, 'Muito ruim, gostei não'), new Comment(user, 'Muito ruim, gostei não'), new Comment(user, 'Muito ruim, gostei não'), new Comment(user, 'Muito ruim, gostei não'), new Comment(user, 'Muito ruim, gostei não') ];
    List<Reviewer> reviewers = <Reviewer> [ new Reviewer(11, '', '') ];
    List<Reviewer> reviewersList = <Reviewer> [ new Reviewer(11, '', ''), new Reviewer(11, '', ''), new Reviewer(11, '', '') ];
    List<Rate> rates = <Rate> [ new Rate(11, 5.0), new Rate(11, 4.0) ];
    List<Rate> ratesFalse = <Rate> [ new Rate(11, 5.0), new Rate(11, 5.0), new Rate(11, 5.0) ];
    List<Rate> rates_2 = <Rate> [ new Rate(11, 3.0), new Rate(11, 2.0) ];
    List<Task> tasks = <Task> [ new Task(11, 'English', true, rates), new Task(11, 'Code Review', true, rates_2), new Task(11, 'Curriculum', true, ratesFalse), new Task(11, 'Interview', true, ratesFalse) ];
    List<Task> tasksList = <Task> [ new Task(11, 'English', false, <Rate> []), new Task(11, 'Code Review', false, <Rate> []) ];

    this._candidates = <Candidate> [
      new Candidate(12, 'Maychell Fernandes de Oliveira', 'maychellfernandes@hotmail.com', city, comments, reviewersList, tasksList),
      new Candidate(11, 'Foo Bar', 'beau@dentedreality.com.au', city, <Comment> [], reviewers, tasks),
    ];
    super.initState();
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final Candidate candidate = await Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new CreateCandidate()),
    );

    if (candidate != null) {
      setState(() {
        this._candidates.add(candidate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('RecruitX')
        ),
        body: new Padding(
          padding: const EdgeInsets.all(4.0),
          child: new ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
            new CandidateCard(_candidates[index]),
            itemCount: _candidates.length
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () => _navigateAndDisplaySelection(context),
          child: new Icon(Icons.person_add),
          backgroundColor: Colors.greenAccent,
        ),
      )
    );
  }
}
