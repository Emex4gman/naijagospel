import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class StateManager with ChangeNotifier {
  static StateManager _stateManager;
  // static SharedPreferences _sharedPreferences;
  StateManager.createInstance();

  factory StateManager() {
    if (_stateManager == null) {
      _stateManager = StateManager
          .createInstance(); // this is executed only once, singleton object
    }
    return _stateManager;
  }
  // get sharedPreferences async {
  //   if (_sharedPreferences == null) {
  //     _sharedPreferences = await initializeSharedPreferences();
  //   }
  //   return _sharedPreferences;
  // }

  // Future<SharedPreferences> initializeSharedPreferences() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs;
  // }
}
