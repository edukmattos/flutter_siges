import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/config/app_config.dart';

import 'auth_controller.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key key, this.title = "Auth"}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends ModularState<AuthPage, AuthController> {
  
  Widget _logo() {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: bigRadius,
      child: appLogo,
    );
  }


  Widget _submitButton() {
    return RaisedButton(
      child: new Text("ENTRAR", style: new TextStyle(color: Colors.white)),
      color: Colors.orange,
      elevation: 15.0,
      //shape: StadiumBorder(),
      onPressed: controller.isFormValid
          ? () async {
              var result = await controller.signIn();
              print("result: $result");
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

  Widget _signInGoogle() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Image(
                image: AssetImage("assets/images/google_logo.png"),
                height: 30.0),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('Entrar com Google',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
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
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(18),
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _logo(),
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
                            prefixIcon: Icon(Icons.email,
                                color: Colors.orange, size: 20),
                            helperText: ' ',
                            errorText: controller.validateEmail()),
                        //validator: (value) {
                        //  if (Validator.required(value)) return 'Obrigatorio.';
                        //  if (Validator.email(value)) return 'Invalido.';
                        //  return null;
                        //}
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
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Senha',
                            prefixIcon: Icon(Icons.lock,
                                color: Colors.orange, size: 20),
                            helperText: ' ',
                            errorText: controller.validatePassword()),
                        //validator: (value) {
                        //  if (Validator.required(value)) return 'Obrigatorio.';
                        //  return null;
                        //}
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
                SizedBox(
                  height: 15,
                ),
                _signInGoogle()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
