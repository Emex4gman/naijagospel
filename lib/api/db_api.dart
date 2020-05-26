import 'package:naijagospel/models/user.dart';

class DbApi {
  Future<User> getUser() async {
    await Future.delayed(Duration(seconds: 2));
    User data = User('EMKA IBEH', 10, 10.0);
    return data;
  }
}

DbApi api = DbApi();
