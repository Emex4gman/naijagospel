import 'dart:convert';
import 'dart:io';
import 'package:naijagospel/api/api_error_handler.dart';
import 'package:naijagospel/models/post_model.dart';
import 'package:http/http.dart';

class ApiManager {
  // static ApiManager _apiManager;

  ApiManager.createInstance();
  String _baseUrl = "https://naijagospel.org/wp-json/wp/v2/";
  ApiManager() {
    ApiManager.createInstance();
  }

  Future<dynamic> fetchPost(String url) async {
    print('Api Get, url $url');
    var responseJson;
    try {
      final response = await get(_baseUrl + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
