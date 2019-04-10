import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:observable_state/observable_state.dart';
import 'package:startup_namer/service.dart';
import 'package:startup_namer/state.dart';
import 'package:startup_namer/application.dart';

class UserInfo extends StatefulWidget {
  final String id;
  UserInfo({Key key, @required this.id}) : super(key: key);
  @override
  createState() => new UserInfoState();
}

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

// class UserInfoState extends State<UserInfo> {
class UserInfoState extends StateObserver<UserInfo, MyState, Changes> {
  @override
  List<Changes> get changes => [Changes.increment, Changes.getuserinfo];
  bool _valueVoice = true;
  bool _valueAppMess = false;

  void _onChangedVoice(bool value) => setState(() => _valueVoice = value);
  void _onChangedAppMess(bool value) => setState(() => _valueAppMess = value);

  User _user;
  Future<User> getData() async {
    var res = await Services.getUserInfo();
    return new User(
        name: res.data['userProfile']['name'],
        account: res.data['userProfile']['account']);
    // setState(() {
    //   _user = User(
    //       name: res.data['userProfile']['name'],
    //       account: res.data['userProfile']['account']);
    // });
    // print(res.then((a) => {print(a.data)}));
  }

  @override
  void initState() {
    super.initState();
    // print(state.user.account);
    // getData();
    // state.getUserInfo();
    // Application.state.increment();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('我的'),
      ),
      body: new FutureBuilder<User>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            User _user = snapshot.data;
            return new ListView(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: new ListTile(
                    title: new Text(_user != null ? _user.name : '',
                        style: new TextStyle(fontWeight: FontWeight.w500)),
                    // title: new Text(state.user != null ? state.user.name : '',
                    //     style: new TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: new Text(_user != null ? _user.account : ''),
                    // new Text(state.user != null ? state.user.account : ''),
                    leading: CircleAvatar(
                      backgroundColor: Colors.brown.shade800,
                      backgroundImage: NetworkImage(
                          'http://jianbihua.com/sites/default/files/styles/nochange/public/images/2018-05/5e9ac85egy1featd58keoj20b40b4div_0.jpg?itok=ovD5cGZz'),
                      // child: Image.asset('images/banner.jpeg'),
                    ),
                  ),
                ),
                new Divider(),
                new Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: new Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('语言'),
                        trailing: Text('简体中文'),
                      ),
                      ListTile(
                        title: Text('声音'),
                        trailing: Switch(
                          value: _valueVoice,
                          onChanged: _onChangedVoice,
                          // activeColor: Colors.red,
                        ),
                      ),
                      new SwitchListTile(
                        value: _valueAppMess,
                        onChanged: _onChangedAppMess,
                        title: new Text('APP消息通知'),
                      ),
                      ListTile(
                        title: Text('关于'),
                      ),
                      ListTile(
                        title: Text('清理缓存'),
                        trailing: Text('9MB'),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('常见问题'),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('修改密码'),
                      ),
                      ListTile(
                        title: Text('账号管理'),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('推出登陆'),
                        onTap: () {
                          print('logout');
                        },
                      ),
                      RaisedButton(
                        onPressed: () {
                          state.increment();
                        },
                        child: Text('${state.counter}'),
                        color: Colors.blue,
                        textColor: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            );
            // return new Text(snapshot.data.title);
          } else if (snapshot.hasError) {
            return new Text("${snapshot.error}");
          }

          // By default, show a loading spinner
          return new Center(
            child: new CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
