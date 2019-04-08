import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:startup_namer/pages/testapp.dart';
import 'package:startup_namer/pages/demo.dart';
import 'package:startup_namer/pages/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: new ThemeData(primaryColor: Colors.blue), home: Home());
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  @override
  void initState() {
    super.initState();

    // fetchData();
  }

/**
 * 当一个状态对象不再需要时，框架调用状态对象的dispose。 您可以覆盖该dispose方法来执行清理工作(清理定时器，清理订阅)
 */
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
                trailing: new Icon(
                  Icons.remove_circle,
                  // color: alreadySaves ? Colors.red : null,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: EdgeInsets.all(16.0),
      // itemExtent: 20.0,
      itemBuilder: (BuildContext context, int index) {
        if (index.isOdd) return new Divider();
        final i = index ~/ 2;
        // 如果是建议列表中最后一个单词对
        if (i >= _suggestions.length) {
          // ...接着再生成10个单词对，然后添加到建议列表
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[i]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaves = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      subtitle: new Text('sub title'),
      leading: CircleAvatar(
        backgroundColor: Colors.brown.shade800,
        child: Text('AH'),
      ),
      // leading: CircleAvatar(
      //   backgroundImage: NetworkImage(
      //       'https://image.shutterstock.com/image-vector/lovely-brunette-girl-avatar-cute-260nw-1182198652.jpg'),
      // ),
      trailing: new Icon(
        alreadySaves ? Icons.favorite : Icons.favorite_border,
        color: alreadySaves ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaves) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
