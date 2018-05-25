import './city.dart';
import './comment.dart';
import './user.dart';
import './reviewer.dart';
import './section.dart';

class Candidate extends User {
  City _city;
  List<Comment> _comments;
  List<Reviewer> _reviewers;
  List<Section> _sections;

  Candidate(int id, String name, String email, this._city, this._comments, this._reviewers, this._sections) : super(id, name, email);

  City get city => _city;
  List<Comment> get comments => _comments;
  List<Reviewer> get reviewers => _reviewers;
  List<Section> get sections => _sections;
  set city(City city) => _city = city;

  String get fullCityName {
    return _city.name + ', ' + _city.state;
  }

  double get totalRate {
//    if (completedTask.isEmpty) {
//      return 0.0;
//    }
//
//    double rateSum = completedTask.map((Task t) => t.taskRate)
//                                  .reduce((v1, v2) => v1 + v2);
//
//    return rateSum / completedTask.length;
    return 0.0;
  }

//  List<Task> get completedTask {
//    return _tasks.where((Task t) => t.isCompleted).toList();
//  }
}