import './rate.dart';

class Task {
  int _id;
  String _name;
  bool _isCompleted;
  List<Rate> _rates;

  Task(this._id, this._name, this._isCompleted, this._rates);

  int get id => _id;
  String get name => _name;
  bool get isCompleted => _isCompleted;
  List<Rate> get rates => _rates;

  double get taskRate {
    if (!_isCompleted) return 0.0;
    return rates.map((Rate rate) => rate.value / _rates.length).reduce((v1, v2) => v1 + v2);
  }
}