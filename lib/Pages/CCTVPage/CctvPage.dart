import 'package:car_parking_system/Controller/CctvController.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CctvPage extends StatefulWidget {
  const CctvPage({super.key});

  @override
  State<CctvPage> createState() => _CctvPageState();
}

class _CctvPageState extends State<CctvPage> {

  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController  = VideoPlayerController.asset("Assets/video/video.mp4");
    chewieController = ChewieController(videoPlayerController: videoPlayerController,aspectRatio: 16/9);
    videoPlayerController.setLooping(true);
    videoPlayerController.play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
    chewieController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    CctvController cctvController = Get.put(CctvController());
    return Scaffold(
      appBar: AppBar(
        title: Text("CCTV Footage"),
      ),
      body: Column(
        children: [
        Text("CCTV"),

        AspectRatio(
          aspectRatio: 16/9,
          child: Chewie(controller: chewieController)),
        ],
      ),
    );
  }
}
