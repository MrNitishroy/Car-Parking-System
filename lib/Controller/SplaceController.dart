import 'package:car_parking_system/Pages/Home/HomePage.dart';
import 'package:get/get.dart';

class SplaceController extends GetxController {
  void onInit() {
    super.onInit();
    splaceHandle();
  }

  Future<void> splaceHandle() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAll(
      HomePage(),
      transition: Transition.fadeIn,
    );
  }
}
