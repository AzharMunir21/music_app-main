

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_hub/Controller/login_controller.dart';
import 'package:music_hub/Controller/registration_controller.dart';
import 'package:music_hub/View/Functions/select_image.dart';
import 'package:music_hub/View/Screens/Authentication/login_view.dart';
import 'package:music_hub/View/Screens/Authentication/registration_view.dart';
import '../../Widgets/text_field.dart';
import '../../Widgets/text_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController controllerForFirstName = TextEditingController();
    TextEditingController controllerForLastName = TextEditingController();
    TextEditingController controllerForEmail = TextEditingController();
    TextEditingController controllerForPassword = TextEditingController();
    RegistrationController controller = Get.put(RegistrationController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: const AssetImage('images/singer1.jpg'),
            fit: BoxFit.fitHeight,
            // opacity: 0.7,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.darken),
          )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //___________________________HEADER SECTION
                heading1('RESET YOUR PASSWORD'),
                SizedBox(
                  height: size.height * 0.09,
                ),

                //_________________________EMAIL
                MyTextField(
                    'Enter Email', const Icon(Icons.email), controllerForEmail),
                SizedBox(
                  height: size.height * 0.03,
                ),

                //_________________________password
                MyTextField('Enter Old Password', const Icon(Icons.lock),
                    controllerForPassword),
                SizedBox(
                  height: size.height * 0.05,
                ),

                //_________________________NEW PASSWORD
                MyTextField('Enter New Password',
                    const Icon(Icons.lock_clock_sharp), controllerForPassword),
                SizedBox(
                  height: size.height * 0.05,
                ),

                //_________________________NEW PASSWORD
                MyTextField(
                    'Enter Confirm  Password',
                    const Icon(Icons.lock_outline_sharp),
                    controllerForPassword),
                SizedBox(
                  height: size.height * 0.05,
                ),

                //______________________LOGIN BUTTON
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 228, 27, 13),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: heading4('Reset'),
                  ),
                ),

                SizedBox(
                  height: size.height * 0.06,
                ),

                //_________________________________REGISTRATION SECTION

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    heading4('Forgot Email'),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to( RegistrationView());
                      },
                      child: redHeading('New Register'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
