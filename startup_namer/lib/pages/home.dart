import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:startup_namer/pages/demo.dart';
import 'package:startup_namer/pages/testapp.dart';
import 'package:startup_namer/pages/randomWords.dart';
import 'package:observable_state/observable_state.dart';
import 'package:startup_namer/state.dart';

class Home extends StatefulWidget {
  @override
  createState() => new HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    void _goHome() {
      Navigator.pushNamed(context, '/demo');
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
            ObserverBuilder<MyState, Changes>(
              changes: [
                Changes.increment,
              ],
              builder: (context, state) {
                return Text('${state.counter}');
              },
            )
            // bindWidget<MyState>(
            //     context, (context, state) => Text('${state.counter}')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: bind<MyState>(context, (state) => state.increment()),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
