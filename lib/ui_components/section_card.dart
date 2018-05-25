import 'package:flutter/material.dart';

import '../model/section.dart';
import '../model/task.dart';
import './task_card.dart';

class SectionCard extends StatelessWidget {

  final Section _section;
  List<TaskCard> _taskCardsSection;

  SectionCard(this._section) {
    _taskCardsSection = buildTaskCardsSection();
  }

  List<TaskCard> buildTaskCardsSection() {
    return _section.tasks.map((Task t) => new TaskCard(t)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(padding: const EdgeInsets.only(top: 14.0)),
          new Text(_section.name, style: new TextStyle(fontWeight: FontWeight.bold)),
          new Padding(padding: const EdgeInsets.only(top: 6.0)),
          new Column(children: _taskCardsSection == null ? [] :_taskCardsSection),
        ],
      ),
    );
  }
}