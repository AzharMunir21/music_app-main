import 'dart:io';

import 'package:flutter/material.dart';
import 'package:music_hub/Controller/album_controller.dart';
import 'package:get/get.dart';
import 'package:music_hub/View/Screens/Admin%20Panel/admin_home_view.dart';
import '../../Functions/select_image.dart';
import '../../Widgets/text_field.dart';
import '../../Widgets/text_widget.dart';

class AddAlbumViewForm extends StatelessWidget {
  // const AddAlbumViewForm({Key? key}) : super(key: key);
  TextEditingController controllerforName = TextEditingController();
  @override
  Widget build(BuildContext context) {

    AlbumController controller = Get.put(AlbumController());

    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                redHeader('ADD NEW ALBUM'),
                SizedBox(
                  height: size.height * 0.1,
                ),
                imagePortion(size),
                SizedBox(
                  height: size.width * 0.05,
                ),
                imageButtonPortion(size),
                SizedBox(
                  height: size.width * 0.05,
                ),

                MyTextField('Album Name ', const Icon(Icons.person), controllerforName ),
                // textfieldPortion(size, controllerforName),
                SizedBox(
                  height: size.width * 0.05,
                ),

           InkWell(
          onTap: () async{

          controller.ImageRef(controllerforName.text);
          await    CircularProgressIndicator();
          Get.to(AdminHomeView());

          },
          child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
          color: const Color.fromARGB(255, 228, 27, 13),
          borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
          child: heading4('Uplaod Album'),
          ),
          ),
          ),


                //buttonPortion()
              ],
            ),
          ),
        ),
      ),
    );
  }

  //_______________________Image Portion
  imagePortion(Size size) {
    return Container(
        height: size.height * 0.40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: GetBuilder<AlbumController>(builder: (value) {
          return value.imageFile == null
              ? const Icon(
                  Icons.image,
                  size: 120,
                )
              : Image.file(
                  value.imageFile!,
                  fit: BoxFit.fill,
                );
        }));
  }

  //____________________IMAGE BUTTON PORTION
  imageButtonPortion(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        heading4('Please Select Album Photo'),
        InkWell(
          onTap: () async {
            File imageFile = await selectImage();
            final value = Get.find<AlbumController>();
            value.updateImage(imageFile);
          },
          child: Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 228, 27, 13),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: heading4('Select Image'),
            ),
          ),
        )
      ],
    );
  }

  //____________________TEXTFIELD PORTION
  // textfieldPortion(Size size, TextEditingController controller) {
  //   return MyTextField('Album Name ', const Icon(Icons.person), controller);
  // }

  //___________________BUTTON PORTION
  // buttonPortion() {
  //   return InkWell(
  //     onTap: () {
  //
  //       ImageRef();
  //
  //     },
  //     child: Container(
  //       height: 40,
  //       width: double.infinity,
  //       decoration: BoxDecoration(
  //         color: const Color.fromARGB(255, 228, 27, 13),
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: Center(
  //         child: heading4('Uplaod Album'),
  //       ),
  //     ),
  //   );
  // }






}
