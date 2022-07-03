import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SongDetailView extends StatelessWidget {
  const SongDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: titleText,
        backgroundColor: Colors.redAccent,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.cancel)),
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return songCard('images/newalbum3.jpg', 'Emanual Bet Younan',
                    'Maneela', size);
              })),
    );
  }

  // ! _________________________NEWSONG CARD

  songCard(String imgurl, String title, String name, Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          SizedBox(
            height: 100,
            width: 90,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(imgurl)),
          ),
          SizedBox(width: size.width * 0.05),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                name,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget titleText = Text('New Songs',
    style: GoogleFonts.josefinSans(
      fontSize: 16,
      fontWeight: FontWeight.w800,
    ));
