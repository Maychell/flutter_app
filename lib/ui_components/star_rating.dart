import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {

  final double _rating;
  List<Icon> _stars;

  StarRating(this._rating) {
    this._stars = buildStars();
  }

  List<Icon> buildStars() {
    List<Icon> teste = <Icon> [];

    for (int rate=1; rate<6; ++rate) {
      if (rate <= _rating) {
        teste.add(buildFilledStar());
      } else {
        teste.add(buildEmptyStar());
      }
    }

    return teste.toList();
  }

  Icon buildFilledStar() {
    return new Icon(Icons.star, color: Colors.yellow[700]);
  }

  Icon buildEmptyStar() {
    return new Icon(Icons.star_border, color: Colors.yellow[700]);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(children: _stars),
    );
  }
  
}