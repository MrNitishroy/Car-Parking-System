import 'package:car_parking_system/Controller/AuthController.dart';
import 'package:car_parking_system/Pages/Auth/LoginPage.dart';
import 'package:car_parking_system/Pages/Home/HomePage.dart';
import 'package:get/get.dart';

class SplaceController extends GetxController {
  void onInit() {
    super.onInit();
    splaceHandle();
  }
  AuthController  authController = Get.put(AuthController());
  Future<void> splaceHandle() async {
    await Future.delayed(Duration(seconds: 3));
    if(authController.auth.currentUser != null){
      Get.offAll(HomePage());
    }else{
      Get.offAll(LoginPage());
    }
  }
}
