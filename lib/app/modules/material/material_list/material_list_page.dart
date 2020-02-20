import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../config/app_config.dart';
import 'material_list_controller.dart';

class MaterialListPage extends StatefulWidget {
  final String title;
  const MaterialListPage({Key key, this.title = appMaterialListPageTag}) : super(key: key);

  @override
  _MaterialListPageState createState() => _MaterialListPageState();
}

class _MaterialListPageState extends ModularState<MaterialListPage, MaterialListController> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: Icon(Icons.add),
        label: Text('Add a Material'),
        onPressed: (){
          Modular.to.pushReplacementNamed('/materials/new');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ]
        )
      ),
      body: Observer(
        name: 'materialListObserver',
        builder: (BuildContext context) {

          if (controller.materials.hasError) {
            print(controller.materials.hasError);
            return Center(
              child: Text(
                'Erro ao realizar a pesquisa !'
              ),
            );
          }

          if (controller.materials.value == null) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              )
            );
          }

          // Ordenacao
          controller.materials.value.sort(
            (material1, material2) => material1.description.toUpperCase().compareTo(material2.description.toUpperCase())
          );

          return ListView.builder(
            itemCount: controller.materials.value.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text(controller.materials.value[index].description),
                subtitle: Text(controller.materials.value[index].description),
                isThreeLine: true,
                trailing: Icon(Icons.account_circle),
                //selected: false,
                onLongPress: (){
                  print("onLongPress");
                },
                onTap: (){},
              );
            }
          );
        }
      ),
    );
  }
}

