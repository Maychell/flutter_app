import 'package:flutter/material.dart';

import '../model/task.dart';
import '../ui_components/task_card.dart';

class TasksList extends StatelessWidget {

  List<Task> _tasks;

  TasksList(this._tasks);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
        new TaskCard(_tasks[index]),
      itemCount: _tasks.length,
    );
  }
}