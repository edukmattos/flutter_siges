import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../config/app_config.dart';
import 'product_list_controller.dart';

class ProductListPage extends StatefulWidget {
  final String title;
  const ProductListPage({Key key, this.title = appProductListPageTag}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends ModularState<ProductListPage, ProductListController> {
  
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
        label: Text('Add a Product'),
        onPressed: (){
          Modular.to.pushReplacementNamed('/products/new');
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
        name: 'productListObserver',
        builder: (BuildContext context) {

          if (controller.products.hasError) {
            print(controller.products.hasError);
            return Center(
              child: Text(
                'Erro a realizar a pesquisa !'
              ),
            );
          }

          if (controller.products.value == null) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              )
            );
          }

          // Ordenacao
          controller.products.value.sort(
            (product1, product2) => product1.description.toUpperCase().compareTo(product2.description.toUpperCase())
          );

          return ListView.builder(
            itemCount: controller.products.value.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text(controller.products.value[index].description),
                subtitle: Text(controller.products.value[index].description),
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

