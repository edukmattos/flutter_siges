import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'material_unit_list_controller.dart';

class MaterialUnitListPage extends StatefulWidget {
  final String title;
  const MaterialUnitListPage({Key key, this.title = "MaterialUnitList"})
      : super(key: key);

  @override
  _MaterialUnitListPageState createState() => _MaterialUnitListPageState();
}

class _MaterialUnitListPageState
    extends ModularState<MaterialUnitListPage, MaterialUnitListController> {
  //use 'controller' variable to access controller

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
