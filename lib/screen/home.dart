import 'package:naijagospel/api/api_manager.dart';
import 'package:naijagospel/components/custom_header.dart';
import 'package:naijagospel/components/custom_indiviual_tile.dart';
import 'package:naijagospel/components/default_scafold.dart';
import 'package:flutter/material.dart';
import 'package:naijagospel/components/featured_container.dart';
import 'package:naijagospel/components/horizontal_event_widget.dart';
import 'package:naijagospel/models/post_model.dart';
import 'package:naijagospel/service/state_manager.dart';
import 'package:naijagospel/utils/font_scaler.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiManager apiManager = ApiManager();
  StateManager stateManager = StateManager();
  int eventPage = 2;
  void initHome() async {
    stateManager.getlistOfPost();
    stateManager.fetchEvents();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initHome();
  }

  List<Widget> _returnPost(List<PostModel> item, {FontScaler fontScaler}) {
    List<Widget> _list = [];

    for (var i = 0; i < item.length; i++) {
      _list.add(CustomIndiviualTile(
        imgUrl: item[i].imgUrl,
        shortDescription: item[i].shortDescription,
        title: item[i].title,
        fontScaler: fontScaler,
      ));
    }
    return _list;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<StateManager>(context, listen: true);
    final fontScaler = FontScaler(context);
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return DefaultScaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 1), () {
            print('adadad');
          });
        },
        child: ListView(
          children: <Widget>[
            CustomHeader(),
            SizedBox(height: 10),
            FeaturedContainer(
              height: _height,
              state: state,
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
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'MORE EVENTS ➡️',
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              height: _height * 0.20,
              color: Colors.white,
              child: HorizontalEventWidget(),
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
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            ..._returnPost(state.listOfPost, fontScaler: fontScaler),
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
                        color: Colors.black54, fontWeight: FontWeight.bold),
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
            ..._returnPost(state.listOfPost, fontScaler: fontScaler),
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
                          color: Colors.black, fontSize: fontScaler.sp(20))),
                  Text('RC Number: 2940160',
                      style: TextStyle(
                          color: Colors.black, fontSize: fontScaler.sp(20)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
