import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:naijagospel/components/custom_header.dart';
import 'package:naijagospel/components/custom_header_plain.dart';
import 'package:naijagospel/components/default_scafold.dart';
import 'package:naijagospel/components/footer.dart';
import 'package:naijagospel/components/video_player_widget.dart';
import 'package:naijagospel/models/post_model.dart';

class SinglePostScreen extends StatefulWidget {
  final PostModel post;
  SinglePostScreen({Key key, this.post})
      : assert(post != null),
        super(key: key);
  @override
  _SinglePostScreenState createState() => _SinglePostScreenState();
}

class _SinglePostScreenState extends State<SinglePostScreen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return DefaultScaffold(
      body: SingleChildScrollView(
        child: Container(
          // height: _height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.black,
              const Color.fromARGB(1, 7, 34, 3),
              Colors.green,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Column(
            children: <Widget>[
              CustomHeaderPlain(),
              Container(
                height: _height * .1,
                decoration: BoxDecoration(
                  color: Colors.black26,
                ),
                child: Center(
                  child: Html(
                    data: widget.post.title,
                    defaultTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                width: _width * .8,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: widget.post.imgUrl,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Html(
                  data: widget.post.description,
                  onLinkTap: (url) {
                    print(url);
                    if (url.contains('you'))
                      showDialog(
                          context: context,
                          builder: (context) =>
                              NaijaGospelVideoPlayer(videoLink: url));
                  },
                  defaultTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
