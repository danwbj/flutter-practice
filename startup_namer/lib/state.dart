import 'package:observable_state/observable_state.dart';
import 'service.dart';

class User {
  User({
    String name,
    String account,
  })  : _name = name,
        _account = account;

  String _name;
  String get name => _name;

  String _account;
  String get account => _account;
}

enum Changes { increment, getuserinfo }

class MyState extends Observable<Changes> {
  int _counter = 0;
  int get counter => _counter;

  User _user;
  User get user => _user;

  String _name = '';
  String get name => _name;

  String _account = '';
  String get account => _account;

  void increment() {
    setState(
      () => _counter++,
      notify: Changes.increment,
    );
  }

  void getUserInfo() {
    Services.getUserInfo().then((res) => {
          setState(() {
            _user = User(
              name: res.data['userProfile']['name'],
              account: res.data['userProfile']['account'],
            );
          }, notify: Changes.getuserinfo)
        });
  }
}
