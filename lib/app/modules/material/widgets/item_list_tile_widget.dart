import 'package:flutter/material.dart';

import '../models/material_model.dart';

class ItemListTileWidget extends StatelessWidget {
  final MaterialModel model;

  const ItemListTileWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.access_alarm),
      title: Text(model.description),
      subtitle: Text(model.code),
      isThreeLine: true,
      trailing: Chip(
        label: Text(model.materialUnit.code),
        avatar: CircleAvatar(child: Text("3")),
      ),
      //selected: false,
      onLongPress: () {
        print("onLongPress");
      },
      onTap: () {},
    );
  }
}
