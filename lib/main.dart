import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_hub/View/Screens/Home/splash_view.dart';

import 'View/Screens/Authentication/verify_email.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ASSYRIAN Songs',
        darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.red),
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home:
        // VerifyScreen());

       SplashView()

    );
  }
}
