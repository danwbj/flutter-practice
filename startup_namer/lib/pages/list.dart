import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  @override
  _State createState() => new _State();
}

//State is information of the application that can change over time or when some actions are taken.
class _State extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('列表'),
        backgroundColor: Colors.red,
      ),
      //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this would produce 2 rows.
            crossAxisCount: 2,
            // Generate 100 Widgets that display their index in the List
            children: new List.generate(5, (index) {
              return new Center(
                child: new Container(
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          // height: 100.0,
                          width: 200.0,
                          // decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //         image: NetworkImage(poke.img))),
                        ),
                        Text(
                          'item${index}',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // child: new Text(
                //   'Item $index',
                //   style: Theme.of(context).textTheme.headline,
                // ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
