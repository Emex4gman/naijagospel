import 'package:naijagospel/api/api_manager.dart';
import 'package:naijagospel/models/post_model.dart';

abstract class BaseContentRepository {
  getPostPage();
  getEvents({int page = 1});
  getLyrics({int page = 1});
  getNewRelease({int page = 1});
  getVideos({int page = 1});
}

class ContentRepository extends BaseContentRepository {
  ApiManager _api = ApiManager();

  Future<List<PostModel>> getPostPage() async {
    final response = await _api.fetchPost('posts');
    return List<PostModel>.from(response.map((x) => PostModel.formJson(x)));
  }

  Future<List<PostModel>> getEvents({int page = 1}) async {
    final response = await _api.fetchPost('posts?categories=4&page=$page');

    return List<PostModel>.from(response.map((x) => PostModel.formJson(x)));
  }

  Future getInterViews({int page = 1}) async {
    final response = await _api.fetchPost('posts?categories=6&page=$page');
    return List<PostModel>.from(response.map((x) => PostModel.formJson(x)));
  }

  Future getLyrics({int page = 1}) async {
    final response = await _api.fetchPost('posts?categories=6&page=$page');
    return List<PostModel>.from(response.map((x) => PostModel.formJson(x)));
  }

  @override
  getNewRelease({int page = 1}) async {
    final response = await _api.fetchPost('posts?categories=10&page=$page');
    return List<PostModel>.from(response.map((x) => PostModel.formJson(x)));
  }

  getQoutes({int page = 1}) async {
    final response = await _api.fetchPost('posts?categories=11&page=$page');
    return List<PostModel>.from(response.map((x) => PostModel.formJson(x)));
  }

  @override
  getVideos({int page = 1}) async {
    final response = await _api.fetchPost('posts?categories=13&page=$page');
    return List<PostModel>.from(response.map((x) => PostModel.formJson(x)));
  }
}
