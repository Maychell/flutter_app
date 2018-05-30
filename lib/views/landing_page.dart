import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './login_page.dart';
import '../model/user.dart';
import './candidates_list.dart';

class LandingPage extends StatelessWidget {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<User> _loadLoggedUser() async {
    final SharedPreferences prefs = await _prefs;
    if(prefs.getString("email") != null) {
      final _id = prefs.getInt("id");
      final _name = prefs.getString("name");
      final _email = prefs.getString("email");
      return new User(_id, _name, _email);
    }
    return null;
  }

  void _redirectTo(BuildContext context) {
    _loadLoggedUser().then((user) {
      final redirectPage = user == null ? new LoginPage() : new CandidatesList(user);

      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (BuildContext context) => redirectPage),
              (Route route) => route == null
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.greenAccent,
      child: new InkWell(
        onTap: () => _redirectTo(context),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'RecruitX',
              style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),
            ),
            new Text(
              'Codeminer 42',
              style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )
    );
  }
}