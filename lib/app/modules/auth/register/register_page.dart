import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/config/app_config.dart';

import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key key, this.title = "Register"}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends ModularState<RegisterPage, RegisterController> {
  
  Widget _submitButton() {
    return RaisedButton(
      child: new Text("REGISTRAR", style: new TextStyle(color: Colors.white)),
      color: Colors.orange,
      elevation: 15.0,
      //shape: StadiumBorder(),
      onPressed: controller.isFormValid
          ? () async {
              var result = await controller.signUp();
              print(result);
              if (result) {
                Modular.to.pushReplacementNamed('/clients');
              } else {
                _flushBar();
                //Modular.to.pushReplacementNamed('/auth');
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
        backgroundColor: appBackgroundColor,
        body: Stack(children: <Widget>[
          Container(
            padding: EdgeInsets.all(18),
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  width: 250,
                  height: 250,
                ),
                SizedBox(
                  height: 40,
                ),
                Observer(
                    name: 'email',
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
                    name: 'password',
                    builder: (_) {
                      return TextFormField(
                        onChanged: controller.changePassword,
                        obscureText: true,
                        maxLines: 1,
                        maxLength: 10,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Senha',
                          prefixIcon:
                              Icon(Icons.lock, color: Colors.orange, size: 20),
                          helperText: ' ',
                          errorText: controller.validatePassword(),
                        ),
                      );
                    }),
                SizedBox(
                  height: 10,
                ),
                Observer(
                    name: 'passwordConfirm',
                    builder: (_) {
                      return TextFormField(
                        onChanged: controller.changePasswordConfirm,
                        obscureText: true,
                        maxLines: 1,
                        maxLength: 10,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Confirmar Senha',
                          prefixIcon:
                              Icon(Icons.lock, color: Colors.orange, size: 20),
                          helperText: ' ',
                          errorText:
                              controller.validatePasswordConfirm(),
                        ),
                      );
                    }),
                SizedBox(
                  height: 20,
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
