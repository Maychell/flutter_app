import 'package:flutter/material.dart';

import '../ui_components/candidate_card.dart';
import '../model/candidate.dart';
import '../model/city.dart';
import '../model/comment.dart';
import '../model/user.dart';
import '../model/reviewer.dart';
import '../model/task.dart';
import '../model/rate.dart';
import '../model/section.dart';
import './create_candidate.dart';
import '../ui_components/drawer_component.dart';

class CandidatesList extends StatefulWidget {

  User _user;

  CandidatesList(this._user);

  @override
  State<StatefulWidget> createState() => new CandidatesListState();
}

class CandidatesListState extends State<CandidatesList> {
  List<Candidate> _candidates;

  @override
  void initState() {
    City city = new City(1, 'Natal', 'RN');
    User user = new User(10, 'Fulano', 'beau@dentedreality.com.au');
    List<Comment> comments = <Comment> [ new Comment(user, 'Muito ruim, gostei não', '10/12/2017'), new Comment(user, 'Muito ruim, gostei não', '11/01/2018'), new Comment(user, 'Muito ruim, gostei não', '10/12/2017'), new Comment(user, 'Muito ruim, gostei não', '10/12/2017'), new Comment(user, 'Muito ruim, gostei não', '10/12/2017'), new Comment(user, 'Muito ruim, gostei não', '11/11/2011'), new Comment(user, 'Hoje pinga', '25/03/2018') ];
    List<Reviewer> reviewers = <Reviewer> [ new Reviewer(11, '', '') ];
    List<Reviewer> reviewersList = <Reviewer> [ new Reviewer(11, '', ''), new Reviewer(11, '', ''), new Reviewer(11, '', '') ];
    List<Rate> rates = <Rate> [ new Rate(11, 5.0), new Rate(11, 4.0) ];
    List<Rate> ratesFalse = <Rate> [ new Rate(11, 5.0), new Rate(11, 5.0), new Rate(11, 5.0) ];
    List<Rate> rates_2 = <Rate> [ new Rate(11, 3.0), new Rate(11, 2.0) ];
    List<Task> tasks = <Task> [ new Task(11, 'English', true, rates), new Task(11, 'Code Review', true, rates_2) ];
    List<Task> tasks_2 = <Task> [ new Task(11, 'Curriculum', true, ratesFalse), new Task(11, 'Interview', true, ratesFalse) ];
    List<Task> tasksList = <Task> [ new Task(11, 'English', false, <Rate> []), new Task(11, 'Code Review', false, <Rate> []) ];

    List<Section> sections = <Section> [ new Section('Section 1', tasks), new Section('Section 2', tasks_2) ];
    List<Section> sectionsList = <Section> [ new Section('Section 1', tasksList) ];

    this._candidates = <Candidate> [
      new Candidate(12, 'Maychell Fernandes de Oliveira', 'maychellfernandes@hotmail.com', city, comments, reviewersList, sections),
      new Candidate(11, 'Foo Bar', 'beau@dentedreality.com.au', city, <Comment> [], reviewers, sectionsList),
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
    final actionButton = new FloatingActionButton(
      onPressed: () => _navigateAndDisplaySelection(context),
      child: new Icon(Icons.person_add),
      backgroundColor: Colors.greenAccent,
    );

    final body = new Padding(
      padding: const EdgeInsets.all(4.0),
      child: new ListView.builder(
        itemBuilder: (BuildContext context, int i) => new CandidateCard(_candidates[i], widget._user),
        itemCount: _candidates.length
      ),
    );

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('RecruitX')
        ),
        drawer: new DrawerComponent(widget._user),
        body: body,
        floatingActionButton: actionButton
      )
    );
  }
}
