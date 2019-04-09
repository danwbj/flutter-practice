import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:observable_state/observable_state.dart';
import 'package:startup_namer/state.dart';

class TestApp extends StatefulWidget {
  final String message;
  TestApp({Key key, @required this.message}) : super(key: key);
  @override
  createState() => new TestAppState();
}

class TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.message),
        // leading: new IconButton(
        //   icon: new Icon(Icons.menu),
        //   tooltip: 'menu',
        //   onPressed: () {},
        // ),
        actions: <Widget>[new IconButton(icon: new Icon(Icons.search))],
      ),
      body: new Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        child: new Card(
            child: new Column(
          children: <Widget>[
            new ListTile(
              title: new Text('1625 Main Street',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              subtitle: new Text('My City, CA 99984'),
              leading: new Icon(
                Icons.restaurant_menu,
                color: Colors.blue[500],
              ),
            ),
            new Divider(),
            new ListTile(
              title: new Text('(408) 555-1212',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              leading: new Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
            ),
            ObserverBuilder<MyState, Changes>(
              changes: [
                Changes.increment,
              ],
              builder: (context, state) {
                return Text('${state.counter}');
              },
            )
          ],
        )),
      ),
      // body: new Center(child: new CircularProgressIndicator()),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}
