import 'package:naijagospel/api/api_manager.dart';
import 'package:naijagospel/models/post_model.dart';

class ContentRepository {
  ApiManager _apiManager = ApiManager();

  Future<List<PostModel>> getPostPage() async {
    List<PostModel> eventList = [];
    final response = await _apiManager.fetchPost('posts');
    for (var i = 0; i < response.length; i++) {
      eventList.add(PostModel.formJson(response[i]));
    }
    return eventList;
  }

  Future<List<PostModel>> getEvents({int page = 1}) async {
    List<PostModel> eventList = [];
    final response =
        await _apiManager.fetchPost('posts?categories=4&page=$page');
    for (var i = 0; i < response.length; i++) {
      eventList.add(PostModel.formJson(response[i]));
    }
    return eventList;
  }
}
