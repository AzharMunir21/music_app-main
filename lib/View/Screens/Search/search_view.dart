import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_hub/Controller/album_detail_controller.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

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
                            hintText: 'Search Album/Song',
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

    );
  }

}

Widget titleText = Text('Search Fav Album Or Song',
    style: GoogleFonts.josefinSans(
      fontSize: 16,
      fontWeight: FontWeight.w800,
    ));
