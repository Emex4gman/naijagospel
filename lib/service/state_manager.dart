import 'package:flutter/foundation.dart';
import 'package:naijagospel/api/api_response_model.dart';
import 'package:naijagospel/models/post_model.dart';
import 'package:naijagospel/repository/content_repository.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class StateManager with ChangeNotifier {
  static StateManager _stateManager;
  ContentRepository _contentRepository = ContentRepository();
  ApiResponse apiPostResponse = ApiResponse.loading('Fetching Details');
  ApiResponse apiEventsResponse;
  Map<String, ApiResponse> responseMap = {};
  // static SharedPreferences _sharedPreferences;
  StateManager.createInstance();
  List<PostModel> listOfPost = [];
  List<PostModel> listOfEvents = [];
  List<PostModel> newReleaseList = [];
  List<PostModel> qouteList = [];
  List<PostModel> videoList = [];
  List<PostModel> jokeList = [];
  List<PostModel> interViewList = [];
  List<PostModel> articlesList = [];
  factory StateManager() {
    if (_stateManager == null) {
      _stateManager = StateManager
          .createInstance(); // this is executed only once, singleton object
    }
    return _stateManager;
  }

  getlistOfPost() async {
    apiPostResponse = ApiResponse.loading('Fetching Details');
    try {
      listOfPost = await _contentRepository.getPostPage();
      apiPostResponse = ApiResponse.completed(listOfPost);
    } catch (e) {
      apiPostResponse = ApiResponse.error(e.toString());
      print(e);
    }

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

  fetchNewRelease() async {
    apiEventsResponse = ApiResponse.loading('Fetching Data');
    responseMap['fetchNewRelease'] = ApiResponse.loading('Fetching Data');
    try {
      newReleaseList = await _contentRepository.getNewRelease();
      apiEventsResponse = ApiResponse.completed(newReleaseList);
    } catch (e) {
      apiEventsResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

  fetchVideos() async {
    apiEventsResponse = ApiResponse.loading('Fetching Data');
    responseMap['fetchNewRelease'] = ApiResponse.loading('Fetching Data');
    try {
      videoList = await _contentRepository.getVideos();
      apiEventsResponse = ApiResponse.completed(videoList);
    } catch (e) {
      apiEventsResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

  fetchQoutes() async {
    apiEventsResponse = ApiResponse.loading('Fetching Data');
    responseMap['fetchQoutes'] = ApiResponse.loading('Fetching Data');
    try {
      qouteList = await _contentRepository.getQoutes();
      apiEventsResponse = ApiResponse.completed(qouteList);
    } catch (e) {
      apiEventsResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

  fetchMoreEvents({int page}) async {
    // apiEventsResponse = ApiResponse.loading('Fetching More Data');
    try {
      List<PostModel> newList = await _contentRepository.getEvents(page: page);
      this.listOfEvents = [...this.listOfEvents, ...newList];
      // apiEventsResponse = ApiResponse.completed(listOfEvents);
    } catch (e) {
      // apiEventsResponse = ApiResponse.error(e.toString());
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
