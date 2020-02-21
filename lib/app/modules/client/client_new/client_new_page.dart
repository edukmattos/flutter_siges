import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/config/app_config.dart';
import 'package:flutter_siges/app/modules/client/client_new/client_new_controller.dart';

class ClientNewPage extends StatefulWidget {
  final String title;
  const ClientNewPage({Key key, this.title = "Client New"}) : super(key: key);

  @override
  _ClientNewPageState createState() => _ClientNewPageState();
}

class _ClientNewPageState extends ModularState<ClientNewPage, ClientNewController> {
  Widget _submitButton() {
    return RaisedButton(
      child: new Text("Confirmar", style: new TextStyle(color: Colors.white)),
      color: Colors.orange,
      elevation: 15.0,
      //shape: StadiumBorder(),
      onPressed: controller.isFormValid
          ? () async {
            print("Client Saved !");
              var result = await controller.save();
              ////print(result);
              if (result) {
                Modular.to.pushReplacementNamed('/clients');
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
                    name: 'einSsaObserver',
                    builder: (_) {
                      return TextFormField(
                        autofocus: true,
                        onChanged: controller.changeEinSsa,
                        obscureText: false,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'CPF/CNPJ',
                          prefixIcon:
                              Icon(Icons.email, color: Colors.orange, size: 20),
                          helperText: ' ',
                          errorText: controller.validateEinSsa(),
                        ),
                      );
                    }),
                SizedBox(
                  height: 10,
                ),
                Observer(
                    name: 'nameObserver',
                    builder: (_) {
                      return TextFormField(
                        autofocus: false,
                        onChanged: controller.changeName,
                        obscureText: false,
                        maxLines: 1,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nome',
                          prefixIcon:
                              Icon(Icons.face, color: Colors.orange, size: 20),
                          helperText: ' ',
                          errorText: controller.validateName(),
                        ),
                      );
                    }),
                SizedBox(
                  height: 10,
                ),
                Observer(
                    name: 'emailObserver',
                    builder: (_) {
                      return TextFormField(
                        autofocus: true,
                        onChanged: controller.changeEmail,
                        obscureText: false,
                        maxLines: 1,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'E-mail',
                          prefixIcon:
                              Icon(Icons.email, color: Colors.orange, size: 20),
                          helperText: ' ',
                          errorText: controller.validateEmail(),
                        ),
                      );
                    }),
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
