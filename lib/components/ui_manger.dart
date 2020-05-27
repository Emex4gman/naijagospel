import 'package:flutter/material.dart';
import 'package:naijagospel/api/api_response_model.dart';
import 'package:naijagospel/components/custom_loading_component.dart';

class UiManager extends StatelessWidget {
  final ApiResponse apiResponse;
  final Widget onCompleteChild;
  UiManager({this.apiResponse, this.onCompleteChild});
  @override
  Widget build(BuildContext context) {
    switch (apiResponse.status) {
      case Status.LOADING:
        return CustomLoader(
          loadingMessage: apiResponse.message,
        );
        break;
      case Status.COMPLETED:
        return onCompleteChild;
        break;
      case Status.ERROR:
        return CustomLoader(
          loadingMessage: apiResponse.message,
        );
        break;
      default:
        return Container();
    }
  }
}
