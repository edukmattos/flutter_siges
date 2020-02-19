import 'package:flutter/material.dart';

class MaterialEditPage extends StatefulWidget {
  final String title;
  const MaterialEditPage({Key key, this.title = "MaterialEdit"})
      : super(key: key);

  @override
  _MaterialEditPageState createState() => _MaterialEditPageState();
}

class _MaterialEditPageState extends State<MaterialEditPage> {
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
