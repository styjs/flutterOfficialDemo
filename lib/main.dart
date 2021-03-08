import 'package:flutter/material.dart';
import './basic_demo/index.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    title: 'Test',
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Study'),
        elevation: 0.0,
      ),

      body: Container(
        padding: EdgeInsets.all(16.0),
        child: CatalogDemo(),
      ),
    );
  }
}

class CatalogDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListItem(title: 'BasicComponent', page: BasicComponentDemo())
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({this.title, this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page)
        );
      },
    );
  }
}