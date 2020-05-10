import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/modules/home/home_controller.dart';
import 'package:flutter_siges/app/widgets/drawer/drawer_home_widget.dart';

class HomePage extends StatefulWidget {
  
  final String title;
  
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {

  int page = 0;
  
  @override
  Widget build(BuildContext context) {
    
    //final Future<String> userEmail = controller.getPrefsUserEmail();

    //print('XuserEmail: $userEmail');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: DrawerHomeWidget(
        page: page,
        userEmail: controller.getPrefsUserEmail().toString(),
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
  