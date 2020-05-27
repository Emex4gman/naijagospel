import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:naijagospel/components/ui_manger.dart';
import 'package:naijagospel/service/state_manager.dart';
import 'package:naijagospel/utils/font_scaler.dart';
import 'package:provider/provider.dart';

class CustomIndiviualTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String shortDescription;
  final FontScaler fontScaler;

  CustomIndiviualTile(
      {this.imgUrl, this.shortDescription, this.title, this.fontScaler});
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<StateManager>(context, listen: false);

    return UiManager(
      apiResponse: state.apiPostResponse,
      onCompleteChild: Container(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    // height: 150,
                    constraints: BoxConstraints(minHeight: 150),

                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: imgUrl,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                SizedBox(width: 6),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      Html(
                        data: title,
                        defaultTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Html(
                        data: shortDescription,
                        defaultTextStyle: TextStyle(
                            color: Colors.white, fontSize: fontScaler.sp(25)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 3),
            Container(
              height: 1.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      const Color(0xFFffffff),
                      const Color(0xFF2bd277),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.6),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
