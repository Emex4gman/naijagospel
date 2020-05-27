import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:naijagospel/api/api_response_model.dart';
import 'package:naijagospel/components/custom_loading_component.dart';
import 'package:naijagospel/components/ui_manger.dart';
import 'package:naijagospel/service/state_manager.dart';
import 'package:naijagospel/utils/font_scaler.dart';

class FeaturedContainer extends StatefulWidget {
  final StateManager state;
  final double height;
  FeaturedContainer({this.state, this.height});

  @override
  _FeaturedContainerState createState() => _FeaturedContainerState();
}

class _FeaturedContainerState extends State<FeaturedContainer>
    with AutomaticKeepAliveClientMixin {
  Timer timer;

  String imageUrl = '';
  randomizeImage(List imageArray) {
    final Random _random = new Random();
    String _imageUrl = imageArray[_random.nextInt(imageArray.length)].imgUrl;
    setState(() {
      imageUrl = _imageUrl;
    });
  }

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 10), (timer) {
      if (widget.state.listOfPost.isNotEmpty) {
        randomizeImage(widget.state.listOfPost);
      }
    });
  }

  @override
  void dispose() {
    // timer.cancel();
    print('iwas dis before');
    super.dispose();
    print('iwas dis after');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final fontScaler = FontScaler(context);
    return UiManager(
      apiResponse: widget.state.apiPostResponse,
      onCompleteChild: Container(
        height: widget.height * 0.30,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: CachedNetworkImage(
                fadeInDuration: Duration(seconds: 2),
                useOldImageOnUrlChange: true,
                imageUrl: widget.state.listOfPost.isNotEmpty ? imageUrl : '',
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
                  itemCount: widget.state.listOfPost.length,
                  itemBuilder: (ctx, i) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      // child: Text('${list[i].title}'),
                      child: Html(
                        data: '${widget.state.listOfPost[i].title}',
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
