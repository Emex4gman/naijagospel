import 'package:flutter/foundation.dart';
import 'package:naijagospel/api/api_response_model.dart';
import 'package:naijagospel/models/post_model.dart';
import 'package:naijagospel/repository/content_repository.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class StateManager with ChangeNotifier {
  static StateManager _stateManager;
  ContentRepository _contentRepository = ContentRepository();
  ApiResponse apiResponse;
  // static SharedPreferences _sharedPreferences;
  StateManager.createInstance();
  List<PostModel> listOfPost = [];
  List<PostModel> listOfEvents = [];
  factory StateManager() {
    if (_stateManager == null) {
      _stateManager = StateManager
          .createInstance(); // this is executed only once, singleton object
    }
    return _stateManager;
  }

  getlistOfPost() async {
    print('getlistOfPost');
    apiResponse = ApiResponse.loading('Fetching Details');
    try {
      listOfPost = await _contentRepository.getPostPage();
      apiResponse = ApiResponse.completed(listOfPost);
    } catch (e) {
      apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    print(apiResponse.toString());

    notifyListeners();
  }

  fetchEvents() async {
    try {
      listOfEvents = await _contentRepository.getEvents();
    } catch (e) {
      print(e);
    }
    notifyListeners();
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
