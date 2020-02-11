import 'package:flutter/material.dart';

class CityPage extends StatefulWidget {
  final String title;
  const CityPage({Key key, this.title = "City"}) : super(key: key);

  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
