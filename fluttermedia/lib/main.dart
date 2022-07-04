import 'dart:async';

import 'dart:html';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart'; as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart'; as RtcRemoteView;
import 'package:flutter/material.dart';


const appId = "b8a814db045c47c381a8234b21df6e09";
const token = "<-- Insert Token -->";
const channel = "test";

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;

  @override 
  void initState(){
    super.initState();
    initAgora();
  }

  Future<void> initAgora() async{

    await window.navigator.getUserMedia(audio: true, video: true);


    _engine = await RtcEngine.create(appId);
    await _engine.enableVideo();
    _engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed){
          print("local user $uid joined");
          setState(() {
            _localUserJoined = true;
          });
        },
        userJoined: (int uid, int elapsed) {
          print("remote user $uid joined");
          setState(() {
            _remoteUid = uid;
          });
        },
        userOffline: (int uid, UserOfflineReason reason) {
          print("remote user $uid left channel");
          setState(() {
            _remoteUid = null;
          });
        },
      ),
    );

    await _engine.joinChannel('', channel, null, 0);
  }


@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
    title: const Text('Video Call'),
    ),
    body: Stack(
      children: [
        Center(
          child: _remoteVideo(),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: 100,
            height: 150,
            child: Center(
              child: _localUserJoined
              ? RtcLocalView.SurfaceView()
              : CircularProgressIndicator(),
              ),
            ),
            ),
      ],
    ),
  );
}


Widget _remoteVideo(){
  if (_remoteUid != null){
    return RtcRemoteView.SurfaceView(
      uid: _remoteUid!,
      channelId: channel,
    );
  } else {
    return Text(
      'Please wait for remote user to join',
      textAlign: TextAlign.center,
    );
  }
}
}
