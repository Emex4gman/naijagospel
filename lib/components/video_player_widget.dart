import 'package:flutter/services.dart';
import 'package:naijagospel/components/default_scafold.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NaijaGospelVideoPlayer extends StatefulWidget {
  final String videoLink;
  NaijaGospelVideoPlayer({Key key, this.videoLink})
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
      flags: YoutubePlayerFlags(autoPlay: true),
    )..addListener(listener);
  }

  void listener() {
    if (_isPlayerReady && mounted && !_youTubeController.value.isFullScreen) {
      setState(() {
        _playerState = _youTubeController.value.playerState;
        _videoMetaData = _youTubeController.metadata;
      });
    }
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _youTubeController.value.isPlaying
      //         ? _youTubeController.pause()
      //         : _youTubeController.play();
      //     setState(() {});
      //   },
      //   child: Icon(
      //     _youTubeController.value.isPlaying ? Icons.play_arrow : Icons.pause,
      //   ),
      // ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // _controller.dispose();
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }
}
