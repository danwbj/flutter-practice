import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'routes.dart';
import 'application.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  _RootState() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  @override
  Widget build(BuildContext context) {
    final app = new MaterialApp(
      theme: new ThemeData(primaryColor: Colors.blue),
      onGenerateRoute: Application.router.generator,
    );
    print("initial route = ${app.initialRoute}");
    return app;
  }
}
