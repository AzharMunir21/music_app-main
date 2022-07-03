import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:music_hub/View/Screens/Admin%20Panel/admin_home_view.dart';
import '../View/Screens/Authentication/verify_email.dart';

class LoginController extends GetxController {
  var admin = 'admin01@gmail.com';

  // void openDialog() {
  //   Get.dialog(
  //     AlertDialog(
  //       title: const Text('Dialog'),
  //       content: const Text('This is a dialog'),
  //       actions: [
  //         TextButton(
  //           child: const Text("Close"),
  //           onPressed: () => Get.back(),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  setValues(String emailValue, String passwordValue) {
    print('Calling......');
    email = emailValue;
    password = passwordValue;
    update();
    // ignore: avoid_print
    print('Email: $email , Password: $password');
  }

  void login(String email, String password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      if (email == admin) {
        Get.to(const AdminHomeView());
      } else {
        return Get.to(VerifyScreen())?.catchError(
                (onError) => Get.snackbar("Error while sign in ", onError.message));
      }
    });
  }

  updateController(String whichController, String value) {
    if (whichController == 'email') {
      emailController.text = value;
      update();
    }

    if (whichController == 'password') {
      emailController.text = value;
      update();
    }
  }
}
