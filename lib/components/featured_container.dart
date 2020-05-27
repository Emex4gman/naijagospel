import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:naijagospel/api/api_response_model.dart';
import 'package:naijagospel/components/custom_loading_component.dart';
import 'package:naijagospel/service/state_manager.dart';
import 'package:naijagospel/utils/font_scaler.dart';

class FeaturedContainer extends StatelessWidget {
  final StateManager state;
  final double height;
  FeaturedContainer({this.state, this.height});
  @override
  Widget build(BuildContext context) {
    final fontScaler = FontScaler(context);
    switch (state.apiPostResponse.status) {
      case Status.LOADING:
        return CustomLoader(
          loadingMessage: state.apiPostResponse.message,
        );
        break;
      case Status.COMPLETED:
        return Container(
          height: height * 0.30,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: CachedNetworkImage(
                  imageUrl: state.listOfPost[0].imgUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  ),
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  // height: _height * 0.30,
                  child: ListView.builder(
                    itemCount: state.listOfPost.length,
                    itemBuilder: (ctx, i) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        // child: Text('${list[i].title}'),
                        child: Html(
                          data: '${state.listOfPost[i].title}',
                          defaultTextStyle: TextStyle(
                              color: Colors.white, fontSize: fontScaler.sp(30)),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        );
        break;
      case Status.ERROR:
        return CustomLoader(
          loadingMessage: 'Erroe',
        );
        break;
      default:
        return Container();
    }
  }
}
