import 'package:flutter/material.dart';

import '../model/candidate.dart';
import '../model/city.dart';

class CreateCandidate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new CreateCandidateState();
}

class CreateCandidateState extends State<CreateCandidate> {
  
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  Candidate _candidate;
  List<City> _cityList;
  City _city;

  CreateCandidateState() {
    this._cityList = <City> [ new City(1, 'Santa Maria', 'SC'), new City(1, 'Natal', 'RN'), new City(1, 'Sao Paulo', 'SP') ];
    this._candidate = new Candidate(1, '', '', null, [], [], []);
  }

  void _submit() {
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('name: ' + _candidate.name + '; email: ' + _candidate.email);

      Navigator.pop(context, _candidate);
      return;
    }

    print('there are errors');
  }

  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Create Candidate'),
        ),
        body: new Container(
          child: new Form(
            key: this._formKey,
            child: new ListView(
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(
                    hintText: 'Foo Bar',
                    labelText: 'Candidate Name'
                  ),
                  validator: (val) => val.isEmpty? 'Candidate name can\'t be empty.' : null,
                  onSaved: (value) => this._candidate.name = value,
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                    hintText: 'example@example.com',
                    labelText: 'Candidate Email',
                  ),
                  validator: (val) => val.isEmpty? 'Candidate email can\'t be empty.' : null,
                  onSaved: (value) => this._candidate.email = value,
                ),
                new DropdownButton(
                  value: _city,
                  hint: new Text('Select a city'),
                  items: _cityList.map(((City city) {
                    return new DropdownMenuItem(
                      value: city,
                      child: new Text(city.name)
                    );
                  })).toList(),
                  onChanged: (city) {
                    setState(() {
                      this._candidate.city = city;
                      _city = city;
                    }
                  );
                  },
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                ),
                new RaisedButton(
                  onPressed: () => _submit(),
                  child: new Text('Cadastrar'),
                )
              ]
            )
          )
        ),
      );
    }
}