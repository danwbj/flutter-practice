import 'package:dio/dio.dart';
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

// class UserInfoState extends State<UserInfo> {
class UserInfoState extends StateObserver<UserInfo, MyState, Changes> {
  bool _valueVoice = true;
  bool _valueAppMess = false;

  void _onChangedVoice(bool value) => setState(() => _valueVoice = value);
  void _onChangedAppMess(bool value) => setState(() => _valueAppMess = value);

  String _name = '';
  String _account = '';
  void getData() async {
    var res = await Services.getUserInfo();
    setState(() {
      _name = res.data['userProfile']['name'];
      _account = res.data['userProfile']['account'];
    });
    // print(res.then((a) => {print(a.data)}));
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('我的'),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: new ListTile(
              title: new Text(_name,
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              subtitle: new Text(_account),
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
