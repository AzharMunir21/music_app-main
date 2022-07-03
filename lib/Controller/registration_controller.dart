import 'dart:io';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:music_hub/View/Screens/Authentication/login_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class RegistrationController extends GetxController {
  File? imageFile;
  // final postRef = FirebaseDatabase.instance.reference().child('post');
  // firebase_storage.FirebaseStorage storage =
  //     firebase_storage.FirebaseStorage.instance;

  FirebaseAuth _auth = FirebaseAuth.instance;
  getImage(File? imagefilevalue) {
    imageFile = imagefilevalue;
    update();
  }

  Future ImageRef() async {
    firebase_storage.Reference ref =
        firebase_storage.FirebaseStorage.instance.ref('musicApp');

    firebase_storage.UploadTask uploadTask = ref.putFile(imageFile!.absolute);
    await Future.value(uploadTask);
    var newUrl = await ref.getDownloadURL();
  }

  void createUser(
    String controllerForFirstName,
    String controllerForLastName,
    String controllerForEmail,
    String controllerForPassword,
  ) async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection("Users");

    Map<String, String> userdata = {
      "First Name": controllerForFirstName,
      "Last Name": controllerForLastName,
      "Email": controllerForEmail,
      "password": controllerForPassword
    };

    await _auth
        .createUserWithEmailAndPassword(
            email: controllerForEmail, password: controllerForPassword)
        .then((value) {
      reference.add(userdata).then((value) => Get.offAll(LoginView()
          // VerifyScreen()

          ));
    }).catchError(
      (onError) =>
          Get.snackbar("Error while creating account ", onError.message),
    );
  }
}
