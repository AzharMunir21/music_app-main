import 'dart:async';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:music_hub/View/Screens/Authentication/login_view.dart';

import '../Authentication/verify_email.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () => Get.to(const
     LoginView()
   // VerifyScreen()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            color: Colors.white38,
            child: Image.asset(
              'images/main.jpeg',
              fit: BoxFit.fill,
            ),
          ),
        ));
  }
}
