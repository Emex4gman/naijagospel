import 'package:flutter/foundation.dart';
import 'package:naijagospel/api/api_response_model.dart';
import 'package:naijagospel/models/post_model.dart';
import 'package:naijagospel/repository/content_repository.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class StateManager with ChangeNotifier {
  static StateManager _stateManager;
  ContentRepository _contentRepository = ContentRepository();
  ApiResponse apiPostResponse;
  ApiResponse apiEventsResponse;
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
    apiPostResponse = ApiResponse.loading('Fetching Details');
    try {
      listOfPost = await _contentRepository.getPostPage();
      apiPostResponse = ApiResponse.completed(listOfPost);
    } catch (e) {
      apiPostResponse = ApiResponse.error(e.toString());
      print(e);
    }
    print(apiPostResponse.toString());

    notifyListeners();
  }

  fetchEvents() async {
    apiEventsResponse = ApiResponse.loading('Fetching Data');
    try {
      listOfEvents = await _contentRepository.getEvents();
      apiEventsResponse = ApiResponse.completed(listOfEvents);
    } catch (e) {
      apiEventsResponse = ApiResponse.error(e.toString());
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
