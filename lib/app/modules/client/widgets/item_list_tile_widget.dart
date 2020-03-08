import 'package:flutter/material.dart';
import 'package:flutter_siges/app/models/client_model.dart';

class ItemListTileWidget extends StatelessWidget {

  final ClientModel model;

  const ItemListTileWidget({Key key, this.model}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.access_alarm),
      title: Text(model.name),
      subtitle: Text(model.einSsa + '\n' + model.email),
      isThreeLine: true,
      trailing: Icon(Icons.keyboard_arrow_right),
      dense: false,
      contentPadding: EdgeInsets.all(0.0),
      //selected: false,
      onLongPress: () {
        print("onLongPress");
      },
      onTap: () {},
    );
  }
}
