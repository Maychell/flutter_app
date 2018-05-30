import './task.dart';

class Section {

  String _name;
  List<Task> _tasks;

  Section(this._name, this._tasks);

  String get name => _name;
  List<Task> get tasks => _tasks;

  List<Task> get completedTask {
    return _tasks.where((Task t) => t.isCompleted).toList();
  }

  double get totalSectionRate {
    double rateSum = completedTask.map((Task t) => t.taskRate).reduce((t1, t2) => t1 + t2);

    return rateSum / completedTask.length;
  }
}