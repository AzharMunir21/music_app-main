import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_hub/Controller/album_detail_controller.dart';

class AlbumDetilView extends StatelessWidget {
  const AlbumDetilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AlbumDetailController controller =Get.put(AlbumDetailController());

    return Scaffold(
      appBar: AppBar(
        title:GetBuilder<AlbumDetailController>(builder: (value){
        if(value.searching==false){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleText,
              InkWell(
                onTap: (){
                  value.updateSearch(true);
                },
                  child: const  Icon(Icons.search, color:Colors.white))
            ],
          );
        }
        else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Expanded(
              flex: 9,
              child:  Container(
                   height: 40 ,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: value.searchController,
                        decoration:const InputDecoration(
                          contentPadding:  EdgeInsets.symmetric(vertical: 20),
                          hintText: 'Search Album',
                        //  prefixIcon: icon,
                          border: InputBorder.none,
                        ),
                        style:
                        GoogleFonts.josefinSans(fontSize: 14, fontWeight: FontWeight.w800, color:Colors.black),
                      ),
                    ),
                  ),
                ),
            ),
              Expanded(
                flex:1,
                    child:Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: InkWell(
                        onTap: (){
                          value.updateSearch(false);
                        },
                        child: const Icon(Icons.search, color:Colors.white),
                      )
                    )
              )

            ],
          );
        }
        }),

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
                return newAlbumCard('images/newalbum1.jpg',
                    'Emanual Bet Younan', 'Maneela', size);
              })),
    );
  }

  //_________________________NEWALBUM CARD

  newAlbumCard(String imgurl, String title, String name, Size size) {
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
              const SizedBox(
                height: 5,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  height: 20,
                  width: 55,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '4.5',
                          style: GoogleFonts.roboto(
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: size.width * 0.02),
                Text(
                  '345 reviews',
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: const Color.fromARGB(255, 71, 70, 70),
                  ),
                ),
              ])
            ],
          )
        ],
      ),
    );
  }
}

Widget titleText = Text('Album Detail',
    style: GoogleFonts.josefinSans(
      fontSize: 16,
      fontWeight: FontWeight.w800,
    ));
