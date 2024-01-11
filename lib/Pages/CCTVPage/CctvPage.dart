import 'package:car_parking_system/Controller/CctvController.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CctvPage extends StatelessWidget {
  const CctvPage({super.key});

  @override
  Widget build(BuildContext context) {
    CctvController cctvController = Get.put(CctvController());
    return Scaffold(
      appBar: AppBar(
        title: Text("CCTV Footage"),
      ),
      body: Column(
        children: [
       
        RotatedBox(
          quarterTurns: 1,
          child: AspectRatio(
            aspectRatio: 16/9,
            child: Chewie(controller: cctvController.chewieController)),
        ),
        ],
      ),
    );
  }
}
