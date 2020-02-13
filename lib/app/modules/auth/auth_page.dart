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

class _AuthPageState extends State<AuthPage> {
  final authController = Modular.get<AuthController>();

  Widget _submitButton() {
    return RaisedButton(
      child: new Text("ENTRAR", style: new TextStyle(color: Colors.white)),
      color: Colors.orange,
      elevation: 15.0,
      //shape: StadiumBorder(),
      onPressed: authController.isFormValid
          ? () async {
              var result = await authController.signIn();
              print("result: $result");
              if (result) {
                Navigator.pushReplacementNamed(context, '/clients');
              } else {
                Navigator.pushReplacementNamed(context, '/');
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
                        onChanged: authController.changeEmail,
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
                            errorText: authController.validateEmail()),
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
                        onChanged: authController.changePassword,
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
                            errorText: authController.validatePassword()),
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
