import 'package:flutter/material.dart';
import 'package:startup_namer/pages/home.dart';
import 'package:startup_namer/pages/demo.dart';
import 'package:startup_namer/pages/testapp.dart';
import 'package:startup_namer/pages/randomWords.dart';
import 'package:observable_state/observable_state.dart';
import 'state.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ObservableProvider(
      state: MyState(),
      child: new MaterialApp(
        theme: new ThemeData(primaryColor: Colors.blue),
        // home: Home(),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (context) => Home(),
          '/demo': (BuildContext context) => Demo(),
          '/testapp': (BuildContext context) => TestApp(),
          '/randomwords': (BuildContext context) => RandomWords(),
        },
      ),
    );
  }
}
