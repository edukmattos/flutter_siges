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
  
  Widget clientsListView(BuildContext context, AsyncSnapshot snapshot) {
    return Observer(
      name: 'clientsListObserver',
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: controller.clients.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(controller.clients[index].name),
                  subtitle: Text(controller.clients[index].email),
                ),
                Divider(
                  height: 1.0,
                )
              ]
            );
          }
        );
      },
    );
  }

  Widget progressIndicator() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.cyan,
            strokeWidth: 5,
          ),
        ),
      ],
    );
  }

  Future<List<ClientModel>> _getData() async {
    var clients = controller.clients;
    return clients;
  }

  @override
  Widget build(BuildContext context) {
    var futureBuilder = FutureBuilder(
      future: _getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return new Text('Sem resultado');
          case ConnectionState.waiting:
            return progressIndicator();
          case ConnectionState.done:
            return clientsListView(context, snapshot);
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return clientsListView(context, snapshot);
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: futureBuilder,
      ),
    );
  }
}
