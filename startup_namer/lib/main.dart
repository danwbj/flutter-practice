import 'package:flutter/material.dart';
import 'package:startup_namer/pages/home.dart';
import 'package:startup_namer/pages/demo.dart';
import 'package:startup_namer/pages/testapp.dart';
import 'package:startup_namer/pages/randomWords.dart';
import 'package:observable_state/observable_state.dart';
import 'state.dart';
import 'routes.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ObservableProvider(
      state: MyState(),
      child: new MaterialApp(
        theme: new ThemeData(primaryColor: Colors.blue),
        home: Home(),
        // initialRoute: '/',
        // routes: <String, WidgetBuilder>{
        //   '/': (context) => Home(),
        //   '/demo': (BuildContext context) => Demo(),
        //   '/testapp': (BuildContext context) => TestApp(),
        //   '/randomwords': (BuildContext context) => RandomWords(),
        // },
        onGenerateRoute: (settings) {
          print(settings.name);
          print(routeNameDemo);
          if (settings.isInitialRoute) {
            return MaterialPageRoute(builder: (context) {
              return Home();
            });
          }

          if (settings.name == routeNameDemo) {
            return MaterialPageRoute(builder: (context) {
              return Demo();
            });
          }

          if (settings.name == routeNameTestApp) {
            return MaterialPageRoute(builder: (context) {
              return TestApp();
            });
          }
          if (settings.name == routeNameRandomWords) {
            return MaterialPageRoute(builder: (context) {
              return RandomWords();
            });
          }
        },
      ),
    );
  }
}
