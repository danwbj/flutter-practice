import 'package:flutter/material.dart';
import 'package:observable_state/observable_state.dart';
import 'state.dart';
import 'root.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ObservableProvider(
      state: MyState(),
      child: Root(),
    );
  }
}
