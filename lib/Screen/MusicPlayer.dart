import 'dart:async';
import 'dart:math';

import 'package:bliss/constants.dart';
import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';
enum PlayerState { stopped, playing, paused }
class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  final url1 = [

    "https://liquidmindmusic.com/mp3/breatheinme.mp3",
    "https://liquidmindmusic.com/mp3/meditation.mp3",
    "https://liquidmindmusic.com/mp3/Serenity.mp3",
    "https://cdn.pixabay.com/download/audio/2020/11/10/audio_547ebbf828.mp3?filename=cancion-triste-1502.mp3",
    "https://cdn.pixabay.com/download/audio/2021/04/30/audio_8ac563deaf.mp3?filename=pixabay-1-min-piano_arp-4222.mp3",

  ];
  final imageuse = [
    "https://images-na.ssl-images-amazon.com/images/I/61seTW3HcDL._SL1001_.jpg",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/how-much-sleep-do-i-need-1616108262.jpg",
    'https://www.universityofcalifornia.edu/sites/default/files/uc-berkeley-wandering-mind-study.jpg',
    'https://specials-images.forbesimg.com/imageserve/5f0dde7ede49b00006d70680/960x0.jpg?cropX1=0&cropX2=1375&cropY1=114&cropY2=1312',
    'https://www.thoughtco.com/thmb/e-lNG0rEXRiAfHNtR6RLOL98XPo=/2576x2576/smart/filters:no_upscale()/drops-of-rain-on-glass-838815210-5a823cc0a18d9e0036e325e2.jpg',

  ];

  Duration duration;
  Duration position;

  AudioPlayer audioPlayer;

  String localFilePath;

  PlayerState playerState = PlayerState.stopped;

  get isPlaying => playerState == PlayerState.playing;
  get isPaused => playerState == PlayerState.paused;

  get durationText =>
      duration != null ? duration.toString().split('.').first : '';

  get positionText =>
      position != null ? position.toString().split('.').first : '';

  bool isMuted = false;

  StreamSubscription _positionSubscription;
  StreamSubscription _audioPlayerStateSubscription;

  @override
  void initState() {
    super.initState();
    initAudioPlayer();
  }

  @override
  void dispose() {
    _positionSubscription.cancel();
    _audioPlayerStateSubscription.cancel();
    audioPlayer.stop();
    super.dispose();
  }

  void initAudioPlayer() {
    audioPlayer = AudioPlayer();
    _positionSubscription = audioPlayer.onAudioPositionChanged
        .listen((p) => setState(() => position = p));
    _audioPlayerStateSubscription =
        audioPlayer.onPlayerStateChanged.listen((s) {
          if (s == AudioPlayerState.PLAYING) {
            setState(() => duration = audioPlayer.duration);
          } else if (s == AudioPlayerState.STOPPED) {
            onComplete();
            setState(() {
              position = duration;
            });
          }
        }, onError: (msg) {
          setState(() {
            playerState = PlayerState.stopped;
            duration = Duration(seconds: 0);
            position = Duration(seconds: 0);
          });
        });
  }


  Future play() async {
    await audioPlayer.play(url1[Random().nextInt(url1.length)]);
    print(url1[Random().nextInt(url1.length)]);
    setState(() {
      playerState = PlayerState.playing;
    });
  }

  Future _playLocal() async {
    await audioPlayer.play(localFilePath, isLocal: true);
    setState(() => playerState = PlayerState.playing);
  }

  Future pause() async {
    await audioPlayer.pause();
    setState(() => playerState = PlayerState.paused);
  }

  Future stop() async {
    await audioPlayer.stop();
    setState(() {
      playerState = PlayerState.stopped;
      position = Duration();
    });
  }

  Future mute(bool muted) async {
    await audioPlayer.mute(muted);
    setState(() {
      isMuted = muted;
    });
  }

  void onComplete() {
    setState(() => playerState = PlayerState.stopped);
  }

  @override
  Widget build(BuildContext context) {
    final _selectedImage= imageuse[Random().nextInt(imageuse.length)];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text("Now Playing"),
        //actions: [Icon(Icons.search)],
      ),
      body:
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
        color: Colors.black,
        child: ListView(
          children: [
            Row(
              children: [Icon(Icons.add), Spacer(), Icon(Icons.send)],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child:
                Image.network(
                  'https://specials-images.forbesimg.com/imageserve/5f0dde7ede49b00006d70680/960x0.jpg?cropX1=0&cropX2=1375&cropY1=114&cropY2=1312',
                  fit: BoxFit.cover,
                  height: 300,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    "Counting Stars",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: mainColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Onerepublic Native",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8), fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            Material(color: Colors.transparent,
                child: _buildPlayer()),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayer() => Container(
    padding: EdgeInsets.all(16.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(mainAxisSize: MainAxisSize.min, children: [
          IconButton(
            disabledColor: Colors.grey,
            onPressed: isPlaying ? null : () => play(),
            iconSize: 64.0,
            icon: Icon(Icons.play_arrow),
            color: mainColor,
          ),
          IconButton(
            disabledColor: Colors.grey,
            onPressed: isPlaying ? () => pause() : null,
            iconSize: 64.0,
            icon: Icon(Icons.pause),
            color: mainColor,
          ),
          IconButton(
            disabledColor: Colors.grey,
            onPressed: isPlaying || isPaused ? () => stop() : null,
            iconSize: 64.0,
            icon: Icon(Icons.stop),
            color:mainColor,
          ),
        ]),
        if (duration != null)
          Slider(
            activeColor: mainColor,
              value: position?.inMilliseconds?.toDouble() ?? 0.0,
              onChanged: (double value) {
                return audioPlayer.seek((value / 1000).roundToDouble());
              },
              min: 0.0,
              max: duration.inMilliseconds.toDouble()),
        if (position != null) _buildMuteButtons(),
        if (position != null) _buildProgressView()
      ],
    ),
  );

  Row _buildProgressView() => Row(mainAxisSize: MainAxisSize.min, children: [
    Padding(
      padding: EdgeInsets.all(12.0),
      child: CircularProgressIndicator(
        value: position != null && position.inMilliseconds > 0
            ? (position?.inMilliseconds?.toDouble() ?? 0.0) /
            (duration?.inMilliseconds?.toDouble() ?? 0.0)
            : 0.0,
        valueColor: AlwaysStoppedAnimation(mainColor),
        backgroundColor: Colors.grey.shade400,
      ),
    ),
    Text(
      position != null
          ? "${positionText ?? ''} / ${durationText ?? ''}"
          : duration != null ? durationText : '',
      style: TextStyle(fontSize: 24.0,color: mainColor),
    )
  ]);

  Row _buildMuteButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        if (!isMuted)
          FlatButton.icon(
            onPressed: () => mute(true),
            icon: Icon(
              Icons.headset_off,
              color: mainColor,
            ),
            label: Text('Mute', style: TextStyle(color: mainColor)),
          ),
        if (isMuted)
          FlatButton.icon(
            onPressed: () => mute(false),
            icon: Icon(Icons.headset, color: mainColor),
            label: Text('Unmute', style: TextStyle(color: mainColor)),
          ),
      ],
    );
  }
}
