import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../Controller/AuthController.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Column(
      children: [
        TextField(
          controller: authController.signupName,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            helperStyle: TextStyle(color: Colors.red),
            hintText: "Full Name",
            prefixIcon: Icon(
              Icons.person_outline_sharp,
            ),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          controller: authController.signupEmail,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(
                Icons.alternate_email_outlined,
              )),
        ),
        const SizedBox(height: 20),
        // const SizedBox(height: 10),
        TextFormField(
          controller: authController.signupPwd,
          onFieldSubmitted: (s) {},
          decoration: const InputDecoration(
              hintText: "Confirm Password",
              prefixIcon: Icon(
                Icons.lock_sharp,
              )),
        ),

        const SizedBox(height: 30),
        Obx(() => authController.isLoading.value
            ? Container(
                height: 50,
                width: 50,
                child: const CircularProgressIndicator(),
              )
            : InkWell(
                onTap: () {
                  authController.signUpWithEmailPassword();
                },
                child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primary),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lock_open_sharp,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "SIGN UP",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )),
      ],
    );
  }
}
