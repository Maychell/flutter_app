import 'package:flutter/material.dart';

import '../model/task.dart';
import './star_rating.dart';

class TaskCard extends StatelessWidget {

  final Task _task;

  TaskCard(this._task);

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      child: new Container(
        padding: const EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
          border: new Border(top: new BorderSide(color: Colors.grey[300]))
        ),
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(_task.name),
                ],
              ),
            ),
            new Padding(padding: const EdgeInsets.all(4.0)),
            new Text(_task.taskRate.toString()),
            new StarRating(_task.taskRate),
            new Padding(padding: const EdgeInsets.only(right: 20.0)),
            new Icon(
              Icons.chevron_right,
              color: Colors.grey[700],
            )
          ],
        ),
      ),
      onTap: () => print('HSAUHSAUHS'),
    );
  }
}