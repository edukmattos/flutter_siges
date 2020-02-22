import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../config/app_config.dart';
import '../../../widgets/custom_combobox/custom_combobox_widget.dart';
import 'material_new_controller.dart';

class MaterialNewPage extends StatefulWidget {
  final String title;
  const MaterialNewPage({Key key, this.title = appMaterialNewPageTag})
      : super(key: key);

  @override
  _MaterialNewPageState createState() => _MaterialNewPageState();
}

class _MaterialNewPageState
    extends ModularState<MaterialNewPage, MaterialNewController> {
      
  Widget _submitButton() {
    return RaisedButton(
      child: new Text("Confirmar", style: new TextStyle(color: Colors.white)),
      color: Colors.orange,
      elevation: 15.0,
      //shape: StadiumBorder(),
      onPressed: controller.isFormValid
          ? () async {
              print("Material Saved !");
              var result = await controller.save();
              ////print(result);
              if (result) {
                Modular.to.pushReplacementNamed('/materials');
              } else {
                _flushBar();
              }
            }
          : null,
    );
  }

  Widget _flushBar() {
    return Flushbar(
      title: controller.errorTitle,
      message: controller.errorMsg,
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      //showProgressIndicator: true,
      //progressIndicatorController: controller.errorMsg,
      //progressIndicatorBackgroundColor: Colors.grey[800],
      margin: EdgeInsets.all(0),
      borderRadius: 0,
      backgroundColor: Colors.red,
      icon: Icon(
        Icons.error_outline,
        size: 30.0,
        color: Colors.white,
      ),
      duration: Duration(seconds: 3),
    )..show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: appBackgroundColor,
          centerTitle: true,
          title: Text(widget.title),
        ),
        backgroundColor: Colors.white,
        body: Stack(children: <Widget>[
          Container(
            padding: EdgeInsets.all(18),
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Observer(
                    name: 'codeObserver',
                    builder: (_) {
                      return TextFormField(
                        autofocus: true,
                        onChanged: controller.changeCode,
                        obscureText: false,
                        maxLines: 1,
                        //keyboardType: TextInputType.number,
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Codigo',
                          prefixIcon:
                              Icon(Icons.email, color: Colors.orange, size: 20),
                          helperText: ' ',
                          errorText: controller.validateCode(),
                        ),
                      );
                    }),
                SizedBox(
                  height: 10,
                ),
                Observer(
                    name: 'descriptionObserver',
                    builder: (_) {
                      return TextFormField(
                        autofocus: false,
                        onChanged: controller.changeDescription,
                        obscureText: false,
                        maxLines: 1,
                        //keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Descricao',
                          prefixIcon:
                              Icon(Icons.face, color: Colors.orange, size: 20),
                          helperText: ' ',
                          errorText: controller.validateDescription(),
                        ),
                      );
                    }),
                SizedBox(
                  height: 10,
                ),
                CustomComboboxWidget(
                  items: [
                    Model("01", "Brasil"),
                    Model("02", "Canada"),
                  ],
                  onChange: (item) {
                    print(item.description);
                  },
                  itemSelected: Model("01", "Brasil"),
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                  items: ["A", "B", "C"]
                    .map((label) => DropdownMenuItem(
                      child: Text(label),
                      value: label,
                    ))
                    .toList(), 
                  onChanged: null
                  ),
                SizedBox(
                  height: 10,
                ),
                Observer(
                    name: 'submitButtonObserver',
                    builder: (_) {
                      return _submitButton();
                    }),
              ],
            ),
          ),
        ]));
  }
}
