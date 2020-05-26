import 'package:naijagospel/components/default_scafold.dart';
import 'package:naijagospel/models/post_model.dart';
import 'package:naijagospel/service/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:naijagospel/utils/font_scaler.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiManager apiManager = ApiManager();
  List<PostModel> list = [];
  int eventPage = 2;
  List<PostModel> eventlist = [];
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    fetchData();
    _scrollController = new ScrollController()..addListener(_scrollListener);
  }

  _scrollListener() async {
    if (_scrollController.position.extentAfter == 0) {
      if (eventPage <= 3) {
        var data2 = await apiManager.getPostPage(page: eventPage);
        setState(() {
          eventlist = [...eventlist, ...data2];
          eventPage = ++eventPage;
        });
      }
    }
  }

  fetchData() async {
    var data = await apiManager.getPost();
    var events = await apiManager.getPostPage(page: 1);
    setState(() {
      list = data;
      eventlist = events;
    });
  }

  List<Widget> _returnPost(List item, {FontScaler fontScaler}) {
    List<Widget> _list = [];

    for (var i = 0; i < item.length; i++) {
      _list.add(Container(
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
                      imageUrl: item[i].imgUrl,
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
                        data: item[i].title,
                        defaultTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Html(
                        data: item[i].shortDescription,
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
                      tileMode: TileMode.clamp)),
            )
          ],
        ),
      ));
    }
    return _list;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fontScaler = FontScaler(context);
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return DefaultScaffold(
        body: list.isEmpty
            ? LinearProgressIndicator(
                backgroundColor: Colors.white,
              )
            : ListView(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          image: AssetImage('assets/header-logo.png'),
                          fit: BoxFit.cover),
                    ),
                    height: _height * 0.15,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.menu),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/nglogo.png',
                                height: 40.0,
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                "NAIJAGOSPEL",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: "Felix Titling",
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "it's all about you",
                                style: TextStyle(
                                  color: Colors.greenAccent[700],
                                  fontFamily: "Mistral",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Icon(Icons.search)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: _height * 0.30,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: CachedNetworkImage(
                            imageUrl: list[0].imgUrl,
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
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            // height: _height * 0.30,
                            child: ListView.builder(
                              itemCount: list.length,
                              itemBuilder: (ctx, i) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  // child: Text('${list[i].title}'),
                                  child: Html(
                                    data: '${list[i].title}',
                                    defaultTextStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: fontScaler.sp(30)),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 20,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'EVENTS',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'MORE EVENTS ➡️',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: _height * 0.20,
                    color: Colors.white,
                    child: ListView.builder(
                        controller: _scrollController,
                        itemCount: eventlist.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, i) {
                          return Container(
                            margin: EdgeInsets.all(1.5),
                            width: _width * 0.30,
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 4,
                                      child: CachedNetworkImage(
                                        imageUrl: eventlist[i].imgUrl,
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          width: _width * 0.35,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Flexible(
                                      // flex: 2,
                                      child: FractionallySizedBox(
                                        child: Container(
                                          padding: EdgeInsets.all(3),
                                          alignment: Alignment.center,
                                          child:
                                              // Text(
                                              //   '${eventlist[i].title.substring(0, 30)}[...]',
                                              //   // textAlign: TextAlign.center,
                                              //   style: TextStyle(
                                              //       fontSize: fontScaler.sp(20)),
                                              // ),
                                              Html(
                                            data:
                                                '${eventlist[i].title.substring(0, 25)} [...]',

                                            // textAlign: TextAlign.center,
                                            defaultTextStyle: TextStyle(
                                              fontSize: fontScaler.sp(15),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          );
                        }),
                  ),
                  Container(
                    height: 20,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'MORE NEWS',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  ..._returnPost(list, fontScaler: fontScaler),
                  Container(
                    height: 20,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'FEATURED VIDEO',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Center(child: Text('Video palyer goes here')),
                    ),
                  ),
                  Divider(height: 5, color: Colors.white),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        height: 30,
                        child: Center(child: Text('HEADLINES')),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                      )),
                      SizedBox(width: 20),
                      Expanded(
                          child: Container(
                        height: 30,
                        child: Center(child: Text('TREANDING')),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                      )),
                    ],
                  ),
                  ..._returnPost(list, fontScaler: fontScaler),
                  Container(
                    // height: _height * 0.15,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/nglogo.png',
                          height: 40.0,
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          "NAIJAGOSPEL",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "Felix Titling",
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0c7ea2)),
                        ),
                        Text(
                            'COPYRIGHT(C) 2013 - ${new DateTime.now().year} NaijaGospel Entertainment',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: fontScaler.sp(20))),
                        Text('RC Number: 2940160',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: fontScaler.sp(20)))
                      ],
                    ),
                  )
                ],
              ));
  }
}
