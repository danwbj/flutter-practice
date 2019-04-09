import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:observable_state/observable_state.dart';
import 'package:startup_namer/state.dart';
import 'package:startup_namer/application.dart';

class Home extends StatefulWidget {
  @override
  createState() => new HomeState();
}

// class HomeState extends State<Home> {
class HomeState extends StateObserver<Home, MyState, Changes> {
  @override
  List<Changes> get changes => [Changes.increment];
  @override
  Widget build(BuildContext context) {
    void _goDome() {
      Application.router.navigateTo(context, "/demo");
      // Navigator.of(context).pushReplacementNamed(routeNameDemo);
      // Navigator.pushNamed(context, '/demo');
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
      var result = 'TestApp';
      Application.router.navigateTo(context, "/testapp?message=$result");
      // Navigator.of(context).push(
      //   new MaterialPageRoute(
      //     builder: (context) {
      //       return new TestApp();
      //     },
      //   ),
      // );
    }

    void _goRandomWords() {
      Navigator.pushNamed(context, '/randomwords');
      // Navigator.of(context).push(
      //   new MaterialPageRoute(
      //     builder: (context) {
      //       return new RandomWords();
      //     },
      //   ),
      // );
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
              onPressed: _goDome,
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
            ),
            Text('${state.counter}')
            // bindWidget<MyState>(
            //     context, (context, state) => Text('${state.counter}')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          state.increment();
        },
        // onPressed: bind<MyState>(context, (state) => state.increment()),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
