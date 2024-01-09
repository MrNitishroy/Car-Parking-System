import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CctvController extends GetxController {
  late VideoPlayerController controller;

  @override
  void onInit() {
    super.onInit();
    initializeVideoPlayer();
  }

  void initializeVideoPlayer() async {
    controller = VideoPlayerController.asset('assets/video/video.mp4')
      ..initialize().then((_) {
        print("Video Player Initialized");
      });
  }

  @override
  void onClose() {
    // Dispose of the controller when the widget is disposed.
    controller.dispose();
    super.onClose();
  }
}
