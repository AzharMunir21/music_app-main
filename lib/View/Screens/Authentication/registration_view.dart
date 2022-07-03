import 'dart:io';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_hub/Controller/registration_controller.dart';
import 'package:music_hub/View/Functions/select_image.dart';
import 'package:music_hub/View/Screens/Authentication/login_view.dart';
import '../../Widgets/text_field.dart';
import '../../Widgets/text_widget.dart';
import 'package:path/path.dart';

class RegistrationView extends GetWidget<RegistrationController> {
  TextEditingController controllerForFirstName = TextEditingController();
  TextEditingController controllerForLastName = TextEditingController();
  TextEditingController controllerForEmail = TextEditingController();
  TextEditingController controllerForPassword = TextEditingController();
  RegistrationController controller = Get.put(RegistrationController());
  // const RegistrationView({Key? key}) : super(key: key);

  // final postRef = FirebaseDatabase.instance.reference().child('post');
  // firebase_storage.FirebaseStorage storage =
  //     firebase_storage.FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                heading1('REGISTRATION'),
                SizedBox(
                  height: size.height * 0.09,
                ),

                //________________________IMAGE SELECTTION
                InkWell(onTap: () async {
                  File? imageFile = await selectImage();
                  final value = Get.find<RegistrationController>();
                  value.getImage(imageFile!);
                  imageFile = value.imageFile;
                  print(basename(imageFile!.path));
                }, child: GetBuilder<RegistrationController>(
                  builder: (value) {
                    return CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      // backgroundImage:AssetImage(),
                      child: value.imageFile == null
                          ? const Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                            )
                          : Image.file(
                              value.imageFile!,
                              fit: BoxFit.cover,
                            ),
                    );
                  },
                )),
                SizedBox(
                  height: size.height * 0.03,
                ),

                //_________________________FIRST NAME
                MyTextField('First Name', const Icon(Icons.person),
                    controllerForFirstName),
                SizedBox(
                  height: size.height * 0.03,
                ),

                //_________________________LAST  NAME
                MyTextField('Last Name', const Icon(Icons.person),
                    controllerForLastName),
                SizedBox(
                  height: size.height * 0.03,
                ),

                //_________________________EMAIL
                MyTextField(
                    'Enter Email', const Icon(Icons.email), controllerForEmail),
                SizedBox(
                  height: size.height * 0.03,
                ),

                //_________________________EMAIL
                MyTextField('Enter Password',
                    const Icon(Icons.lock_clock_sharp), controllerForPassword),
                SizedBox(
                  height: size.height * 0.05,
                ),

                //______________________LOGIN BUTTON

                TextButton(
                    onPressed: () {
                      RegisterUser();
                      controller.ImageRef();
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 228, 27, 13),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: heading4('Register'),
                      ),
                    )),

                SizedBox(
                  height: size.height * 0.06,
                ),

                //_________________________________REGISTRATION SECTION

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    heading4('Already Have An Account'),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(LoginView());
                      },
                      child: redHeading('SignIn'),
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

  void RegisterUser() {
    controller.createUser(
        controllerForFirstName.text,
        controllerForLastName.text,
        controllerForEmail.text,
        controllerForPassword.text);
  }
}
