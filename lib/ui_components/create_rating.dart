import 'package:flutter/material.dart';

class CreateRating extends StatefulWidget {
  final String _ratingName;

  CreateRating(this._ratingName);

  @override
  State<StatefulWidget> createState() => new CreateRatingState();
}

class CreateRatingState extends State<CreateRating> {
  int _partialRating;
  String _state;
  List<Widget> _stars;

  CreateRatingState() {
    _partialRating = 0;
    _state = 'Bora vota ne?';
    _stars = _buildStars(0);
  }

  _setRating(int value) {
    final _newState = _buildState(value);

    setState(() {
      this._partialRating = value;
      this._state = _newState;
      this._stars = _buildStars(value);
    });
  }

  String _buildState(int value) {
    switch (value) {
      case 1:
        return "Plmds, naaam :'( :'(";
      case 2:
        return "Muito ruim :(";
      case 3:
        return "É... :|";
      case 4:
        return "Até q gostei :)";
      case 5:
        return "Ô, o cara é bom ein? :D :D";
    }
  }

  List<Widget> _buildStars(int value) {
    final List<Widget> myStar = <Widget>[];

    for(int i=1; i<6; ++i) {
      if(i <= value) {
        myStar.add(buildFilledStar());
      } else {
        myStar.add(buildEmptyStar());
      }
    }

    return myStar;
  }

  Icon buildFilledStar() {
    return new Icon(Icons.star, color: Colors.yellow[700]);
  }

  Icon buildEmptyStar() {
    return new Icon(Icons.star_border, color: Colors.yellow[700]);
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
        children: <Widget> [
          new Text(widget._ratingName),
          new Row(
            children: <Widget>[
              new InkWell(
                onTap: () => _setRating(1),
                child: _stars.elementAt(0),
              ),
              new InkWell(
                onTap: () => _setRating(2),
                child: _stars.elementAt(1),
              ),
              new InkWell(
                onTap: () => _setRating(3),
                child: _stars.elementAt(2),
              ),
              new InkWell(
                onTap: () => _setRating(4),
                child: _stars.elementAt(3),
              ),
              new InkWell(
                onTap: () => _setRating(5),
                child: _stars.elementAt(4),
              ),
            ],
          ),
          new Text(_state),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new MaterialButton(onPressed: () => Navigator.pop(context), child: new Text('Cancelar')),
              new MaterialButton(onPressed: () => Navigator.pop(context, _partialRating), child: new Text('Rate')),
            ],
          )
        ]
    );
  }
}