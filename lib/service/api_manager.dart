import 'dart:convert';

import 'package:naijagospel/models/post_model.dart';
import 'package:http/http.dart';

class ApiManager {
  // static ApiManager _apiManager;

  ApiManager.createInstance();
  String baseUrl = "https://naijagospel.org/wp-json/wp/v2/";
  ApiManager() {
    ApiManager.createInstance();
  }

  Future<List<PostModel>> getPost() async {
    List<PostModel> list = [];
    Response response = await get(baseUrl + 'posts');

    List resBody = json.decode(response.body);

    if (response.statusCode == 200) {
      for (var i = 0; i < resBody.length; i++) {
        list.add(PostModel.formJson(resBody[i]));
      }
    }
    return list;
  }

  Future<List<PostModel>> getEvents() async {
    List<PostModel> eventList = [];
    Response response = await get(baseUrl + 'posts?categories=4');

    List resBody = json.decode(response.body);

    if (response.statusCode == 200) {
      for (var i = 0; i < resBody.length; i++) {
        eventList.add(PostModel.formJson(resBody[i]));
      }
    }
    return eventList;
  }

  Future<List<PostModel>> getPostPage({int page}) async {
    List<PostModel> eventList = [];
    Response response = await get(baseUrl + 'posts?categories=4&page=$page');

    List resBody = json.decode(response.body);

    if (response.statusCode == 200) {
      for (var i = 0; i < resBody.length; i++) {
        eventList.add(PostModel.formJson(resBody[i]));
      }
    }
    return eventList;
  }
}
