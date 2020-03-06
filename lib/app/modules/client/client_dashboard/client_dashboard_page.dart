import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/src/api/async.dart';
import 'package:substring_highlight/substring_highlight.dart';
import '../../../config/app_config.dart';
import '../../../models/client_model.dart';
import 'client_dashboard_controller.dart';

class ClientDashboardPage extends StatefulWidget {
  final String title;
  
  const ClientDashboardPage({Key key, this.title = appClientDashboardPageTag})
      : super(key: key);

  @override
  _ClientDashboardPageState createState() => _ClientDashboardPageState();
}

class _ClientDashboardPageState
    extends ModularState<ClientDashboardPage, ClientDashboardController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),
          onPressed: (){
            showSearch(
              context: context,
              delegate: DataSearch()
            );
          },)
        ],
      ),

      body: Column(
        children: <Widget>[],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {

  final clients = [
    "Eduardo Camara de Mattos",
    "BRUNA PEREIRA DE MATTOS",
    "Sandra Pereira de Mattos",
    "Solange Pereira",
    "Sonia Pereira Bortolini",
    "Antonio Francisco Meireles de Mattos",
    "Clara Maria Camara de Mattos"
  ];

  //final clients = [];

  final recentClients = [
    "Sandra Pereira de Mattos",
    "Solange Pereira",
    "Sonia Pereira Bortolini"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading Icon on the left on the bar app
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show some results based on the selection
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );    
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show whem someone searches for something
    final suggestionList = query.isEmpty 
      ? recentClients 
      : clients.where((c) => c.contains(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: (){
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: SubstringHighlight(
          text: suggestionList[index], 
          term: query,
          textStyle: TextStyle(                       // non-highlight style                       
            color: Colors.grey,
          ),
          textStyleHighlight: TextStyle(              // highlight style
            color: Colors.black,
            decoration: TextDecoration.underline,
          ), 
        )
      ),
      itemCount: suggestionList.length,
    );
  }  
} 