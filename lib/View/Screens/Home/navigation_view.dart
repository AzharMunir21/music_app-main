import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_hub/Controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:music_hub/View/Screens/Home/home_view.dart';
import 'package:music_hub/View/Screens/Search/search_view.dart';

import '../Setting/setting_view.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (value) {
        if (value.index == 0) {
          return  HomeView();
        }
        if(value.index==1) {
          return const SearchView();
        }
        if (value.index == 2) {
          return const SettingView();
        }
        return Container();
      }),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60,
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Row(children: [
          //___________________________________ONE

          Expanded(
            child: InkWell(
              onTap: () {
                controller.updateIndex(0);
              },
              child: Column(
                children: [
                  const Icon(
                    Icons.queue_music,
                    color: Colors.white,
                    size: 30,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Home',
                    style: GoogleFonts.josefinSans(
                        fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          //___________________________________Two

          Expanded(
            child: InkWell(
              onTap: () {
                controller.updateIndex(1);
              },
              child: Column(
                children: [
                  const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Search',
                    style: GoogleFonts.josefinSans(
                        fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          //___________________________________Three

          Expanded(
            child: InkWell(
              onTap: () {
                controller.updateIndex(2);
              },
              child: Column(
                children: [
                  const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Profile',
                    style: GoogleFonts.josefinSans(
                        fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
