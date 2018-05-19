import 'package:flutter/material.dart';

import '../model/task.dart';
import './star_rating.dart';

class TaskCard extends StatelessWidget {

  final Task _task;

  TaskCard(this._task);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                new Text(_task.name),
              ],
            ),
          ),
          new Padding(padding: const EdgeInsets.all(3.0)),
          new Text(_task.taskRate.toString()),
          new StarRating(_task.taskRate),
          new Padding(padding: const EdgeInsets.only(right: 20.0))
        ],
      )
    );
  }
}