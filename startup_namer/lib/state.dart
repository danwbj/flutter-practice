import 'package:observable_state/observable_state.dart';

enum Changes {
  increment,
}

class MyState extends Observable<Changes> {
  int _counter = 0;
  int get counter => _counter;

  void increment() {
    print('----');
    setState(
      () => _counter++,
      notify: Changes.increment,
    );
  }
}
