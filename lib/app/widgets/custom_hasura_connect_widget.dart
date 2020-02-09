import 'package:hasura_connect/hasura_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/hasura_config.dart';

class CustomHasuraConnectWidget {
  static HasuraConnect getConnect(SharedPreferences sharedPreferences) {
    if (sharedPreferences.containsKey('token')) {
      String token = sharedPreferences.get('token');
      return HasuraConnect(
        hasura_config_url,
        token: (_) async => 'Bearer $token',
      );
    } else {
      return HasuraConnect(
        hasura_config_url,
      );
    }
  }
}
