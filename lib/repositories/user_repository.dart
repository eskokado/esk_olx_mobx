﻿import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../models/user.dart';
import 'table_keys.dart';

class UserRepository {
  Future<void> signup(User user) async {
    final parseUser = ParseUser(user.email, user.password, user.email);
    parseUser.set<String>(keyUserName, user.name);
    parseUser.set<String>(keyUserPhone, user.phone);
    parseUser.set(keyUserType, user.type.index);

    await parseUser.signUp();
  }
}
