import 'package:flutter/material.dart';

import '../model/task.dart';

class TaskCard extends StatelessWidget {

  final Task _task;

  TaskCard(this._task);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Text(_task.name),
          new Padding(padding: const EdgeInsets.all(3.0)),
          new Text(_task.taskRate.toString())
        ],
      )
    );
  }
}