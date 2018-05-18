import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _likeOrDislike() {
    setState(() {
      if (_counter < 0) {
//        _loveMessage = 'Sorry man :(';
//        _imageMood = 'images/angry.jpg';
        return;
      }

      if (_counter == 0) {
//        _loveMessage = '';
//        _imageMood = 'images/unhappy.jpg';
        return;
      }

      if (_counter < 5) {
//        _loveMessage = "You're not loved, but liked";
//        _imageMood = 'images/fake-smile.png';
        return;
      }

//      _loveMessage = "Wow, you're fucking loved, man";
//      _imageMood = 'images/happy.jpg';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(10.0),
              child: new Row(
                children: [
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Image.asset(
                        'images/fake-smile.png',
                        width: 80.0,
                        height: 80.0,
                      )
                    ],
                  ),
                  new Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Container(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: new Text(
                            'Maychell Fernandes',
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        new Text(
                          'Natal, RN',
                          style: new TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Icon(
                            Icons.star,
                            color: Colors.yellow[700],
                          ),
                          new Icon(
                            Icons.star,
                            color: Colors.yellow[700],
                          ),
                          new Icon(
                            Icons.star,
                            color: Colors.yellow[700],
                          ),
                          new Icon(
                            Icons.star,
                            color: Colors.yellow[700],
                          ),
                          new Icon(
                            Icons.star,
                            color: Colors.yellow[700],
                          ),
                        ],
                      ),
                      new Text(
                          'Rate: 40%',
                          style: new TextStyle(
                            color: Colors.grey[500],
                          )
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
