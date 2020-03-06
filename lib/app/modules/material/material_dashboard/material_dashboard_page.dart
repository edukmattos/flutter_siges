import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/modules/material/material_dashboard/material_dashboard_controller.dart';

import '../../../config/app_config.dart';

class MaterialDashboardPage extends StatefulWidget {
  final String title;
  const MaterialDashboardPage({Key key, this.title = appMaterialDashboardPageTag})
      : super(key: key);

  @override
  _MaterialDashboardPageState createState() => _MaterialDashboardPageState();
}

class _MaterialDashboardPageState
    extends ModularState<MaterialDashboardPage, MaterialDashboardController> {
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.zero,
              child: Center(
                child: Image(
                  image: ExactAssetImage("images/logo.png"),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('Partner'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.multiline_chart),
              title: Text('Proyek'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Observer(
            builder: (BuildContext context) {
              return Text(controller.count.toString());
            }
          )
          
          
          ],
      ),
    );
  }
}
