import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'auth_controller.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key key, this.title = "Auth"}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends ModularState<AuthPage, AuthController> {
  
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
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {},
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage("assets/images/google_logo.png"),
                height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
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
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(18),
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.jpeg',
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
                    name: 'submitButton',
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
