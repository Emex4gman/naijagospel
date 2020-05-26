import 'dart:async';

import 'package:naijagospel/api/db_api.dart';
import 'package:naijagospel/bloc_provider/bloc_provider.dart';
import 'package:naijagospel/models/user.dart';

class UserBloc implements BlocBase {
  User _user;
  // stream to handel the user
  StreamController<User> _userStreamController =
      StreamController<User>.broadcast();
  Sink<User> get _inUser => _userStreamController.sink;
  Stream<User> get outUser => _userStreamController.stream;

  UserBloc() {
    init();
  }
  void init() async {
    _user = await api.getUser();

    _inUser.add(_user);
  }

  @override
  void dispose() {
    _userStreamController.close();
  }

  void updateUser(User user) {
    _user = user;
    _inUser.add(user);
  }
}
