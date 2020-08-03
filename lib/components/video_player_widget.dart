import 'package:flutter/services.dart';
import 'package:naijagospel/components/default_scafold.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NaijaGospelVideoPlayer extends StatefulWidget {
  final String videoLink;
  final bool autoPlay;
  NaijaGospelVideoPlayer({Key key, this.videoLink, this.autoPlay = true})
      : assert(videoLink != null && videoLink.contains('youtu')),
        super(key: key);

  @override
  _NaijaGospelVideoPlayerState createState() => _NaijaGospelVideoPlayerState();
}

class _NaijaGospelVideoPlayerState extends State<NaijaGospelVideoPlayer> {
  // VideoPlayerController _controller;
  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;
  YoutubePlayerController _youTubeController;

  @override
  void initState() {
    super.initState();
    _youTubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoLink),
      flags: YoutubePlayerFlags(
        autoPlay: widget.autoPlay,
      ),
    )..addListener(listener);
  }

  void listener() {
    // if (_isPlayerReady && mounted && !_youTubeController.value.isFullScreen) {
    //   setState(() {
    //     _playerState = _youTubeController.value.playerState;
    //     _videoMetaData = _youTubeController.metadata;
    //   });
    // }
  }
  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _youTubeController.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: Center(
          child: YoutubePlayer(
        controller: _youTubeController,
        showVideoProgressIndicator: true,
        onReady: () {
          print("am ready");
        },
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // _controller.dispose();
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }
}
