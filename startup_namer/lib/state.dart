import 'package:observable_state/observable_state.dart';
import 'service.dart';
import 'package:dio/dio.dart';

enum Changes { increment, getuserinfo }

class MyState extends Observable<Changes> {
  int _counter = 0;
  int get counter => _counter;

  Object _user = null;
  Object get user => _user;

  void increment() {
    setState(
      () => _counter++,
      notify: Changes.increment,
    );
  }

  void getUserInfo() async {
    print('+++++');
    // Dio dio = new Dio();
    // Response response =
    //     await dio.get("http://yapi.nasawz.com/mock/18/api/v1/users/current");
    // print(response);

    // // var res = await Services.getUserInfo();
    // setState(() {
    //   // print(res)
    //   // _user = '${res.data['weather']['condition']}';
    // }, notify: Changes.getuserinfo);
  }
}
