import 'dart:async';

import 'package:flutter/material.dart';

import '../model/task.dart';
import '../model/rate.dart';
import './star_rating.dart';
import './create_rating.dart';

class TaskCard extends StatefulWidget {
  final Task _task;

  TaskCard(this._task);

  @override
  State<StatefulWidget> createState() => new TaskCardState(_task);
}

class TaskCardState extends State<TaskCard> {

  final Task _task;

  TaskCardState(this._task);

  Future<Null> _askedToLead() async {
    int _rateValue = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return new SimpleDialog(
            children: <Widget>[new CreateRating(_task.name)],
          );
        }
    );

    print(_rateValue);
    print(_task.rates.length);

    if (_rateValue == null) return;

    final _rate = new Rate(1, _rateValue.toDouble());

    setState(() {
      this._task.rates.add(_rate);
    });
  }

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
            new Text(_task.taskRate.toStringAsFixed(1)),
            new StarRating(widget._task.taskRate),
            new Padding(padding: const EdgeInsets.only(right: 20.0)),
            new Icon(
              Icons.chevron_right,
              color: Colors.grey[700],
            )
          ],
        ),
      ),
      onTap: () => _askedToLead(),
    );
  }
}