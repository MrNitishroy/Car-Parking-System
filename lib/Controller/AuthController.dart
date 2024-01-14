import 'package:car_parking_system/Pages/Auth/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Pages/Home/HomePage.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLogin = false.obs;
  RxBool isPwdHide = true.obs;
  final auth = FirebaseAuth.instance;
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPwd = TextEditingController();
  TextEditingController signupEmail = TextEditingController();
  TextEditingController signupName = TextEditingController();
  TextEditingController signupPwd = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> loginWithEmailPassword() async {
    isLoading.value = true;
    await auth.signInWithEmailAndPassword(
        email: loginEmail.text, password: loginPwd.text);
    Get.offAll(
      HomePage(),
      transition: Transition.fadeIn,
    );
    isLoading.value = false;
  }

  Future<void> signUpWithEmailPassword() async {
    isLoading.value = true;
    await auth.createUserWithEmailAndPassword(
      email: signupEmail.text,
      password: signupPwd.text,
    );
    Get.offAll(
      HomePage(),
      transition: Transition.fadeIn,
    );
    isLoading.value = false;
  }

  Future<void> signOut() async {
    auth.signOut();
    Get.off(LoginPage());
  }
}
