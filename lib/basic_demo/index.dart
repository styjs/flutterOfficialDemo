import 'package:flutter/material.dart';
import './container_demo.dart';

class BasicComponentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Component'),
        elevation: 0.0,
      ),

      body: Container(
        padding: EdgeInsets.all(6.0),
        child: ListView(
          children: <Widget>[
            ListItem(
              title: 'Contianer',
              page: ContainerDemo()
            )
          ]
        ),
      ),
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