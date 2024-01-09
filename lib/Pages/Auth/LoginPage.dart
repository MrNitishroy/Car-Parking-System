import 'package:car_parking_system/Controller/AuthController.dart';
import 'package:car_parking_system/Pages/Home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../Controller/ThemeController.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    ThemeController themeController = Get.put(ThemeController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "Assets/Icons/logo.svg",
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("SAVE & SECURE",
                            style: Theme.of(context).textTheme.headlineLarge),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            child: Text(
                          "Welcome to Car Parking System you can book your parking slot from any where with you phone",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelSmall,
                        )),
                      ],
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Obx(
                      () => authController.isLoading.value
                          ? CircularProgressIndicator()
                          : InkWell(
                              onTap: () {
                              authController.signInWithGoogle();
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: SvgPicture.asset(
                                      "Assets/Icons/google.svg",
                                      width: 30,
                                    ),
                                  ),
                                  Text(
                                    "Login With Google",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  SizedBox(width: 1)
                                ],
                              ),
                            ),
                    ))
              ]),
        ),
      ),
    );
  }
}
