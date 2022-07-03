import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_hub/View/Screens/Admin%20Panel/admin_home_view.dart';
import 'package:music_hub/View/Screens/Authentication/forgot_password_view.dart';
import 'package:music_hub/View/Screens/Authentication/registration_view.dart';
import 'package:music_hub/View/Screens/Authentication/verify_email.dart';
import 'package:music_hub/View/Screens/Home/navigation_view.dart';
import 'package:music_hub/View/Widgets/snack_bar.dart';
import 'package:music_hub/View/Widgets/text_field.dart';
import 'package:music_hub/View/Widgets/text_widget.dart';
import 'package:get/get.dart';

import '../../../Controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   LoginController controller = Get.put(LoginController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: const AssetImage('images/singer1.jpg'),
          fit: BoxFit.fitHeight,
          // opacity: 0.7,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
        )),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //___________________________HEADER SECTION
              heading1('LOGIN'),
              SizedBox(
                height: size.height * 0.09,
              ),
              //__________________________EMAIL  SECTION
              Align(
                alignment: Alignment.topLeft,
                child: heading4('Email'),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              GetBuilder<LoginController>(builder: (value) {
                return MyTextField('Enter Email', const Icon(Icons.email),
                    value.emailController);
              }),

              SizedBox(
                height: size.height * 0.03,
              ),

              //____________________________PASSWORD SECTION
              Align(
                alignment: Alignment.topLeft,
                child: heading4('Password'),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              MyTextField('Enter Password', const Icon(Icons.lock),
                  controller.passwordController),
              SizedBox(
                height: size.height * 0.03,
              ),

              //______________________________LOGIN BUTTON SECTION
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Get.to(const ForgotPasswordView());
                      },
                      child: heading4('Forgot Password')),
                  InkWell(
                    onTap: () {
              Get.to(NavigationView());
              //         Get.to(AdminHomeView());
              //         final value = Get.find<LoginController>();
                     //  String email = controller.emailController.text;
                     //  String password = controller.passwordController.text;
                     //  value.setValues(email, password);
                     //  whereMove(email, password);
                     //
                     // value.login(email,password) ;
                     //  Get.to(VerifyScreen());
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 228, 27, 13),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: heading4('Login'),
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(
                height: size.height * 0.06,
              ),

              //_________________________________REGISTRATION SECTION

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  heading4('I have not an Acocunt'),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to( RegistrationView());

                    },
                    child: redHeading('SignUp'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  //_________________________________WHERE MOVE
  whereMove(String username, String password) {
    if (username.toLowerCase() == 'admin' &&
        password.toLowerCase() == 'admin') {
      Get.to(const AdminHomeView());
      snackBar('Welcome in ASSYRIAN Songs', 'Enjoy latest Songs',
          const Icon(Icons.notifications, color: Colors.white));
    }
    if (username.toLowerCase() == 'user' && password.toLowerCase() == 'user') {
      Get.to(const NavigationView());
      snackBar('Welcome in ASSYRIAN Songs', 'Enjoy latest Songs',
          const Icon(Icons.notifications, color: Colors.white));
    } else {
      snackBar('Oh ! No', 'Wrong Username or Password',
          const Icon(Icons.error, color: Colors.white));
    }
  }
}

// ignore: must_be_immutable
class TextFiledWidget extends StatelessWidget {
  TextFiledWidget(
      {Key? key,
      required this.controler,
      required this.hint,
      required this.icon})
      : super(key: key);

  TextEditingController controler;
  String hint;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60 ,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextField(
          controller: controler,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            hintText: hint,
            prefixIcon: icon,
            border: InputBorder.none,
          ),
          style: GoogleFonts.josefinSans(
              fontSize: 14, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }




}
