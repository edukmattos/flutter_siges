import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../models/client_model.dart';
import 'client_controller.dart';

class ClientListPage extends StatefulWidget {
  final String title;
  const ClientListPage({Key key, this.title = "Client List"}) : super(key: key);

  @override
  _ClientListPageState createState() => _ClientListPageState();
}

class _ClientListPageState
    extends ModularState<ClientListPage, ClientController> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: Icon(Icons.add),
        label: Text('Add a Client'),
        onPressed: (){},
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
        builder: (BuildContext context) {

          if (controller.clients.hasError) {
            print(controller.clients.hasError);
            return Center(
              child: Text(
                'Erro a realizar a pesquisa !'
              ),
            );
          }

          if (controller.clients.value == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // Ordenacao
          controller.clients.value.sort(
            (client1, client2) => client1.name.toUpperCase().compareTo(client2.name.toUpperCase())
          );

          return ListView.builder(
            itemCount: controller.clients.value.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text(controller.clients.value[index].name),
                subtitle: Text(controller.clients.value[index].email),
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

