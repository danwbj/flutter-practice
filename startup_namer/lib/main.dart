import 'package:flutter/material.dart';
import 'package:observable_state/observable_state.dart';
import 'state.dart';
import 'root.dart';
import 'application.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // Application.state = initState;
  @override
  Widget build(BuildContext context) {
    final initState = MyState();
    Application.state = initState;
    return ObservableProvider(
      state: initState,
      child: Root(),
    );
  }
}
