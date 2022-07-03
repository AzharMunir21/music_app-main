import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../Home/navigation_view.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  bool isEmailVarified = false;
  bool canResendEmail = false;

  // FirebaseAuth _auth = FirebaseAuth.instance;
   User? user;
  Timer? timer;

  @override
  void initState() {
    isEmailVarified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVarified) {
      sendVarificationEmail();
    }
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      checkEmailVarified();
    });
  }

  Future sendVarificationEmail() async {
    try {
      user = FirebaseAuth.instance.currentUser!;
      await user?.sendEmailVerification();

      setState(() {
        canResendEmail = false;
      });

      await Future.delayed(Duration(seconds: 5));

      setState(() {
        canResendEmail = true;
      });
    } catch (e) {
      Get.snackbar(" ", e.toString());
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVarified() async {
    await FirebaseAuth.instance.currentUser?.reload();

    setState(() {
      isEmailVarified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVarified) timer?.cancel();
  }

  @override
  Widget build(BuildContext context) => isEmailVarified
      ?  NavigationView()     //HomeView()
      :Scaffold(
          appBar: AppBar(title: const Text('Email Verify')),
          backgroundColor: Colors.white,
          body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.,

                children: const [
                  Text(
                    "Please Verify Email Link ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 65, width: 65, child: CircularProgressIndicator())
                ],
              )));
}






// import 'dart:async';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // import 'package:get/get_core/src/get_main.dart';
//
// import '../Home/navigation_view.dart';
//
// class VerifyScreen extends StatefulWidget {
//   const VerifyScreen({Key? key}) : super(key: key);
//
//   @override
//   State<VerifyScreen> createState() => _VerifyScreenState();
// }
//
// class _VerifyScreenState extends State<VerifyScreen> {
//   bool isEmailVarified = false;
//   bool canResendEmail = false;
//
//   // FirebaseAuth _auth = FirebaseAuth.instance;
//   late User user;
//   Timer? timer;
//
//   @override
//   void initState() {
//     isEmailVarified = FirebaseAuth.instance.currentUser!.emailVerified;
//     if (!isEmailVarified) {
//       sendVarificationEmail();
//     }
//     timer = Timer.periodic(Duration(seconds: 2), (timer) {
//       checkEmailVarified();
//     });
//   }
//
//   Future sendVarificationEmail() async {
//     try {
//       user = FirebaseAuth.instance.currentUser!;
//       await user.sendEmailVerification();
//
//       setState(() {
//         canResendEmail = false;
//       });
//
//       await Future.delayed(Duration(seconds: 5));
//
//       setState(() {
//         canResendEmail = true;
//       });
//     } catch (e) {
//       Get.snackbar(" ", e.toString());
//     }
//   }
//
//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }
//
//   Future checkEmailVarified() async {
//     await FirebaseAuth.instance.currentUser?.reload();
//
//     setState(() {
//       isEmailVarified = FirebaseAuth.instance.currentUser!.emailVerified;
//     });
//
//     if (isEmailVarified) timer?.cancel();
//   }
//
//   @override
//   Widget build(BuildContext context) => isEmailVarified
//       ? NavigationView() //HomeView()
//       : Scaffold(
//           appBar: AppBar(title: Text('Email Verfy')),
//           backgroundColor: Colors.white,
//           body: Container(
//               height: double.infinity,
//               width: double.infinity,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 // crossAxisAlignment: CrossAxisAlignment.,
//
//                 children: const [
//                   Text(
//                     "Please Vavify Email Link ",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                       height: 65, width: 65, child: CircularProgressIndicator())
//                 ],
//               )),
//         );
// }
