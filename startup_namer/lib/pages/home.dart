import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:startup_namer/pages/demo.dart';
import 'package:startup_namer/pages/testapp.dart';
import 'package:startup_namer/pages/randomWords.dart';

class Home extends StatefulWidget {
  @override
  createState() => new HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    void _goHome() {
      Navigator.pushNamed(context, '/');
      // Navigator.push(context, MaterialPageRoute<void>(
      //   builder: (BuildContext context) {
      //     return Demo();
      //   },
      // ));

      // Navigator.of(context).push(
      //   new MaterialPageRoute(
      //     builder: (context) {
      //       return new Demo();
      //     },
      //   ),
      // );
    }

    void _goTestApp() {
      Navigator.of(context).push(
        new MaterialPageRoute(
          builder: (context) {
            return new TestApp();
          },
        ),
      );
    }

    void _goRandomWords() {
      Navigator.of(context).push(
        new MaterialPageRoute(
          builder: (context) {
            return new RandomWords();
          },
        ),
      );
    }

    return new Scaffold(
        appBar: new AppBar(
          title: new Text('home'),
        ),
        body: new Center(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(
                onPressed: _goHome,
                child: Text('Go Demo'),
                color: Colors.blue,
                textColor: Colors.white,
              ),
              RaisedButton(
                onPressed: _goTestApp,
                child: Text('Go TestApp'),
                color: Colors.blue,
                textColor: Colors.white,
              ),
              RaisedButton(
                onPressed: _goRandomWords,
                child: Text('Go RandomWords'),
                color: Colors.blue,
                textColor: Colors.white,
              ),
            ],
          ),
        ));
  }
}
