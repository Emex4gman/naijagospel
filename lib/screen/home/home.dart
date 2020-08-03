import 'package:naijagospel/api/api_manager.dart';
import 'package:naijagospel/components/banner.dart';
import 'package:naijagospel/components/custom_header.dart';
import 'package:naijagospel/components/custom_indiviual_tile.dart';
import 'package:naijagospel/components/default_scafold.dart';
import 'package:flutter/material.dart';
import 'package:naijagospel/components/drawer.dart';
import 'package:naijagospel/components/featured_container.dart';
import 'package:naijagospel/components/footer.dart';
import 'package:naijagospel/components/horizontal_event_widget.dart';
import 'package:naijagospel/components/video_player_widget.dart';
import 'package:naijagospel/models/post_model.dart';
import 'package:naijagospel/service/state_manager.dart';
import 'package:naijagospel/utils/font_scaler.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  final ApiManager apiManager = ApiManager();
  final StateManager stateManager = StateManager();
  int eventPage = 2;
  void initHome() async {
    stateManager.getlistOfPost();
    stateManager.fetchEvents();
    stateManager.fetchNewRelease();
    stateManager.fetchQoutes();
    stateManager.fetchVideos();
    setState(() {});
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    initHome();
  }

  List<Widget> _returnPost(List<PostModel> items, {FontScaler fontScaler}) {
    return List<Widget>.from(items.map((item) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/post', arguments: item),
          child: CustomIndiviualTile(
            imgUrl: item.imgUrl,
            shortDescription: item.shortDescription,
            title: item.title,
            fontScaler: fontScaler,
          ),
        )));
  }

  @override
  void dispose() {
    super.dispose();
  }

  var nuum = 0;

  @override
  Widget build(BuildContext context) {
    print(nuum += 1);

    final state = Provider.of<StateManager>(context, listen: true);
    final fontScaler = FontScaler(context);
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(Duration(seconds: 1), () {
              print('adadad');
            });
          },
          child: ListView(
            children: <Widget>[
              CustomHeader(openDrawer: _openDrawer),
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
              CustomBanner('MORE NEWS'),

              ..._returnPost(state.listOfPost, fontScaler: fontScaler),
              CustomBanner('FEATURED VIDEO'),
              Container(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Center(
                      child:new NaijaGospelVideoPlayer(
                    videoLink: 'https://www.youtube.com/embed/WtAHhlIAd20',
                    autoPlay: false,
                  )),
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

              CustomBanner('NEW RELEASE'),
              ..._returnPost(state.newReleaseList, fontScaler: fontScaler),
              CustomBanner('Videos'),
              ..._returnPost(state.videoList, fontScaler: fontScaler),
              CustomBanner('QOUTES'),
              ..._returnPost(state.qouteList, fontScaler: fontScaler),
              // ..._returnPost(state.listOfPost, fontScaler: fontScaler),
              Footer()
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
