import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../config/app_config.dart';
import '../../../widgets/drawer/drawer_home_widget.dart';
import 'material_dashboard_controller.dart';

class MaterialDashboardPage extends StatefulWidget {
  final String title;
  const MaterialDashboardPage({Key key, this.title = appMaterialDashboardPageTag})
      : super(key: key);

  @override
  _MaterialDashboardPageState createState() => _MaterialDashboardPageState();
}

class _MaterialDashboardPageState
    extends ModularState<MaterialDashboardPage, MaterialDashboardController> {

  int page = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          PopupMenuButton<int>(
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<int>>[
                PopupMenuItem(
                  value: 0,
                  child: Text('Login'),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Text('Einstellungen'),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text('Download-Container'),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text('Soziale Netzwerke'),
                ),
                PopupMenuItem(
                  value: 3,
                  child: Text('FAQ'),
                ),
              ];
            },
          ),
        ],
      ),
      drawer: DrawerHomeWidget(
        page: page,
        onTap: (int value) {
          setState(() {
            page = value;
          });
        }
      ),
      body: IndexedStack(
        index: page,
        children: <Widget>[
          Container(color: Colors.blue),
          Container(color: Colors.red),
        ],
      ),
    );
  }
}
