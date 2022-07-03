import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_hub/View/Screens/Admin%20Panel/add_album_view.dart';
import 'package:music_hub/View/Screens/Admin%20Panel/add_song_view.dart';
import '../../Widgets/text_widget.dart';

class AdminHomeView extends StatelessWidget {
  const AdminHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.darken),
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //___________________________HEADER SECTION
                redHeader('ADMIN PANEL'),
                SizedBox(
                  height: size.height * 0.03,
                ),
                albumContainer(size),
                SizedBox(
                  height: size.height * 0.03,
                ),
                midleSection(size),
                SizedBox(
                  height: size.height * 0.03,
                ),
                bottomSection(size)
              ],
            ),
          ),
        ));
  }

  //_________________________________TOP SECTION
  albumContainer(Size size) {
    return InkWell(
      onTap: () {
        Get.to(AddAlbumViewForm());
      },
      child: Container(
        height: size.height * 0.23,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            customText('Add New Album', Colors.red, 18.0),
            Image.asset(
              'images/album.png',
              width: 80,
              height: 80,
            )
          ],
        ),
      ),
    );
  }

  //_____________________________MIDDLE ECTION
  midleSection(Size size) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              Get.to( AddSongViewForm());
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              height: size.height * 0.27,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customText('Add Songs', Colors.red, 18.0),
                  Image.asset(
                    'images/song1.png',
                    width: 80,
                    height: 80,
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: size.height * 0.27,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customText('View Songs', Colors.red, 18.0),
                Image.asset(
                  'images/song1.png',
                  width: 80,
                  height: 80,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  //_____________________________BOTTOM  SECTION
  bottomSection(Size size) {
    return Container(
      height: size.height * 0.2,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customText('More', Colors.red, 18.0),
          Image.asset(
            'images/more1.png',
            width: 80,
            height: 80,
          )
        ],
      ),
    );
  }
}
