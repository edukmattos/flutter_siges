import 'package:flutter/material.dart';

import 'package:cloud_firestore_all/cloud_firestore_all.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/modules/city/city_controller.dart';

class CityListPage extends StatefulWidget {
  final String title;
  const CityListPage({Key key, this.title = "City List"})
      : super(key: key);

  @override
  _CityListPageState createState() => _CityListPageState();
}

class _CityListPageState extends State<CityListPage> {

  final cityController = Modular.get<CityController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        name: 'cities',
        builder: (BuildContext context) {
          return ListView.builder(
            itemCount: cityController.cityList.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(
                cityController.cityList[index].description
              );
            }
          );
        }
      ),
    );
  }
}
