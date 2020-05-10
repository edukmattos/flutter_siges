import 'package:flutter/material.dart';

class DrawerHomeWidget extends StatelessWidget {

  final int page;
  final Function(int) onTap;
  final String userEmail;

  const DrawerHomeWidget({Key key, this.page, this.onTap, this.userEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Eduardo Mattos'), 
              accountEmail: Text(userEmail),
              currentAccountPicture: CircleAvatar( 
                child: Text('EM')               
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  child: Text('K')
                )
              ],
            ),
            ListTile(
              selected: page == 0,
              title: Text('Cadastro'),
              trailing: Icon(Icons.arrow_upward),
              onTap: () {
                onTap(0);
              },
            ),
             ListTile(
              selected: page == 1,
              title: Text('Movimentações'),
              trailing: Icon(Icons.arrow_upward),
              onTap: () {
                onTap(1);
              },
            ),
            Divider(),
            ListTile(
              selected: page == 2,
              title: Text('Compras'),
              trailing: Icon(Icons.arrow_upward),
              onTap: () {
                onTap(2); 
              },
            )
          ],
        ),
      );
  }
}