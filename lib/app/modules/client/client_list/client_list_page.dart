import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../config/app_config.dart';
import '../../../models/client_model.dart';
import '../widgets/item_list_tile_widget.dart';
import 'client_list_controller.dart';

class ClientListPage extends StatefulWidget {
  final String title;
  const ClientListPage({Key key, this.title = appClientListPageTag}) : super(key: key);

  @override
  _ClientListPageState createState() => _ClientListPageState();
}

class _ClientListPageState extends ModularState<ClientListPage, ClientListController> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: appBackgroundColor,
        centerTitle: true,
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: Icon(Icons.add),
        label: Text('Add a Client'),
        onPressed: (){
          Modular.to.pushReplacementNamed('/clients/new');
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
        name: 'clientListObserver',
        builder: (_) {

          List<ClientModel> list = controller.clients.data;

          if (controller.clients.hasError) {
            print(controller.clients.hasError);
            return Center(
              child: Text(
                'Erro a realizar a pesquisa !'
              ),
            );
          }

          if (controller.clients.data == null) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              )
            );
          }

          // Ordenacao
          controller.clients.value.sort(
            (client1, client2) => client1.name.toUpperCase().compareTo(client2.name.toUpperCase())
          );

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, int index) {

              ClientModel model = list[index];

              return Card(
                child: ItemListTileWidget(
                  model: model
                ),
              );
            }
          );
        }
      ),
    );
  }
}

