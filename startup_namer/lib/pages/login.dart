import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void _goLogin() {
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    Widget LoginForm = Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Container(
            child: new TextField(
              decoration: InputDecoration(
                  labelText: '请输入你的姓名', icon: new Icon(Icons.phone)
                  // helperText: '请输入你的真实姓名',
                  ),
              onChanged: null,
              autofocus: false,
            ),
          ),
          // new TextField(
          //   decoration: InputDecoration(
          //       labelText: '请输入你的姓名', icon: new Icon(Icons.phone)
          //       // helperText: '请输入你的真实姓名',
          //       ),
          //   onChanged: null,
          //   autofocus: false,
          // ),
          new TextField(
            decoration: InputDecoration(
                labelText: '请输入你的密码)', icon: new Icon(Icons.lock)),
            onChanged: null,
            autofocus: false,
          ),
          new Container(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              splashColor: Colors.redAccent,
              color: Colors.blue,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              onPressed: _goLogin,
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.centerRight,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    color: Colors.transparent,
                    onPressed: () => {},
                    child: Text(
                      "忘记密码?",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/banner.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: LoginForm,
        ),
      ),
    );
  }
}
