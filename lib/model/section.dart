import './task.dart';

class Section {

  String _name;
  List<Task> _tasks;

  Section(this._name, this._tasks);

  String get name => _name;
  List<Task> get tasks => _tasks;
}