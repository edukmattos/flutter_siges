import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key key, this.title = "Register"}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final registerController = Modular.get<RegisterController>();

  Widget _submitButton() {
    return RaisedButton(
      child: new Text("REGISTRAR", style: new TextStyle(color: Colors.white)),
      color: Colors.orange,
      elevation: 15.0,
      //shape: StadiumBorder(),
      onPressed: registerController.isFormValid
          ? () async {
              var result = await registerController.signUp();
              print(result);
              if (result) {
                Navigator.pushReplacementNamed(context, '/clients');
              } else {
                Navigator.pushReplacementNamed(context, '/auht');
              }
            }
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: <Widget>[
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
                        onChanged: registerController.changeEmail,
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
                          errorText: registerController.validateEmail(),
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
                        onChanged: registerController.changePassword,
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
                          errorText: registerController.validatePassword(),
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
                        onChanged: registerController.changePasswordConfirm,
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
                              registerController.validatePasswordConfirm(),
                        ),
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
              ],
            ),
          ),
        ]));
  }
}
