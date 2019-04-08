import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TestApp extends StatefulWidget {
  @override
  createState() => new TestAppState();
}

class TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('hello'),
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'menu',
          onPressed: () {},
        ),
        actions: <Widget>[new IconButton(icon: new Icon(Icons.search))],
      ),
      body: new Container(
        // margin: const EdgeInsets.all(60.0),
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
          ],
        )),
        // child: new Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     new Icon(Icons.star, color: Colors.green),
        //     new Icon(Icons.star, color: Colors.green),
        //     new Icon(Icons.star, color: Colors.green)
        //   ],
        // ),
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

// class MyAppBar extends StatelessWidget {
//   MyAppBar({this.title});
//   final Widget title;
//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       height: 100.0,
//       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
//       decoration: new BoxDecoration(color: Colors.blue[500]),
//       child: new Row(
//         children: <Widget>[
//           new IconButton(
//             icon: new Icon(Icons.menu),
//           ),
//           new Expanded(
//             child: title,
//           ),
//           new IconButton(
//             icon: new Icon(Icons.search),
//           )
//         ],
//       ),
//     );
//   }
// }
