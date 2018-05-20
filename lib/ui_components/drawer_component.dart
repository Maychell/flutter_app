import 'package:flutter/material.dart';

import '../model/user.dart';
import '../views/login_page.dart';
import '../views/create_candidate.dart';
import '../views/candidates_list.dart';

class DrawerComponent extends StatelessWidget {

  final User _user;
  String _gravatarUrl;
  final String _baseGravatarUrl = 'https://www.gravatar.com/avatar/';

  DrawerComponent(this._user) {
    _gravatarUrl = _baseGravatarUrl + _user.emailMd5;
  }

  @override
    Widget build(BuildContext context) {
      return new Drawer(
          child: new ListView(
            children: <Widget> [
              new UserAccountsDrawerHeader(
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new NetworkImage(_gravatarUrl),
                ),
                accountEmail: new Text(_user.email),
                accountName: new Text(_user.name)
              ),
              new ListTile(
                title: new Text('Candidate List'),
                trailing: new Icon(Icons.list),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new CandidatesList(_user)), (Route route) => route == null);
                },
              ),
              new Divider(),
              new ListTile(
                title: new Text('Logout'),
                trailing: new Icon(Icons.exit_to_app),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new LoginPage()), (Route route) => route == null);
                },
              ),
            ],
          )
        );
    }
}