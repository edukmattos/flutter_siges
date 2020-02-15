import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../config/hasura_config.dart';

class CustomHasuraConnectWidget {
  static HasuraConnect getConnect(FirebaseAuth auth) {
    return HasuraConnect(
      hasura_config_url,
      token: (_) async {

        var user = await auth.currentUser();

        var token = await user.getIdToken(refresh: true);

        //Se retornar um token invalido
        if (token != null) {
          return "Bearer ${token.token}";
        } else {
          Modular.to.pushReplacementNamed('/auth');
        }
      }
    );
  }
}
