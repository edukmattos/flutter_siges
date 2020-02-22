import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';

class CustomComboboxWidget extends StatelessWidget {
  
  final List<Model> items;
  final Function (Model) onChange;
  final Model itemSelected;

  const CustomComboboxWidget({
    Key key, 
    @required this.items, 
    @required this.onChange, 
    @required this.itemSelected}) 
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FindDropdown<Model>(
      items: items,
      onChanged: (Model item) => onChange(item),
      selectedItem: itemSelected,
      validate: (Model item) {
        if (item == null)
          return "Obrigatorioo.";
        else
          return null; //return null to "no error"
      },
      dropdownBuilder: (_, model) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2
            ),
          ),
          child: model?.id == null
            ? ListTile(
                title: Text(
                  'Selecionar'
                )
              )  
            : ListTile(
                title: Text(
                  model.description
                )
              )
        );
      },
    );
  }
}

class Model {
  final String id;
  final String description;

  Model(this.id, this.description);

  @override
  String toString() => description.toString();

  @override
  operator==(o) => o is Model && o.id == id;

  @override
  int get hashCode => id.hashCode ^ description.hashCode;
}
