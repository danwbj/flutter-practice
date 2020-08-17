import 'package:flutter/material.dart';
import 'package:observable_state/observable_state.dart';
import 'state.dart';
import 'root.dart';
import 'application.dart';

void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   // Application.state = initState;
//   @override
//   Widget build(BuildContext context) {
//     final initState = MyState();
//     Application.state = initState;
//     return ObservableProvider(
//       state: initState,
//       child: Root(),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   // Application.state = initState;
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Hello, worldsddds!',
//         textDirection: TextDirection.ltr,
//       ),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Hello, ddd!',
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
