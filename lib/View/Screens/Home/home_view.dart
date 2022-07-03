import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_hub/Model/AlbumModel.dart';
import 'package:music_hub/View/Screens/Detailed/album_detail_view.dart';
import 'package:get/get.dart';
import 'package:music_hub/View/Screens/Detailed/songs_detail.dart';

import '../../../Controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());

  ///1st
  List<AlbumCategory> albumCategoryList1 = [];

  ///2nd

  List<AlbumCategory> albumCategoryList2 = [];

  ///3rd

  List<AlbumCategory> albumCategoryList3 = [];

  late final TopSlider _topSlider;

  @override
  Widget build(BuildContext context) {
    Widget albumCategory1() {
      return Row(
          children: albumCategoryList1
              .map((e) => TopSlider(imgUrl: e.albumImage, nameUrl: e.albumName))
              .toList());
    }

    Widget albumCategory2() {
      return Row(
          children: albumCategoryList2
              .map((e) => TopSlider(imgUrl: e.albumImage, nameUrl: e.albumName))
              .toList());
    }

    Widget albumCategory3() {
      return Row(
          children: albumCategoryList2
              .map((e) => TopSlider(imgUrl: e.albumImage, nameUrl: e.albumName))
              .toList());
    }

    ///1st
    controller.getAlbumdata1();
    albumCategoryList1 = controller.albumCategoryList1;

    ///2nd
    controller.getAlbumdata2();
    albumCategoryList2 = controller.albumCategoryList1;

    ///3rd
    controller.getAlbumdata3();
    albumCategoryList3 = controller.albumCategoryList1;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    height: 250,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        albumCategory1(),
                        albumCategory2(),
                        albumCategory3()
                      ],
                    )
                    // TopSlider(imgurl: 'dfd', nameurl: '',),
                    ),
                addSpace(size.width * 0.01),
                const PlayButtonSection(),
                TextButton(
                    onPressed: () {
                      print(albumCategoryList1[0].albumImage);
                      print(albumCategoryList2[0].albumImage);
                      print(albumCategoryList3[0].albumImage);
                    },
                    child: Text('onClick')),
                addSpace(size.width * 0.01),
                const PlayListSection(),
                const NewAlbumSection(),
                const NewSongSection()
              ],
            ),
          ),
        ),
      ),
    );
  }

  addSpace(double siz) {
    return SizedBox(
      height: siz,
    );
  }

  topSliderCard() {}
}

//____________________________________________TOP SLIDER

class TopSlider extends StatelessWidget {
  final String imgUrl;
  final String nameUrl;

  TopSlider({
    required this.imgUrl,
    required this.nameUrl,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.9,
      height: 200,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            imgUrl,
            fit: BoxFit.fill,
          )),
    );
  }
}

// class TopSlider extends StatelessWidget {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 9,
//         itemBuilder: (context, index) {
//           return topSliderCard(size,AllalbumCategoryList[index] );
//         });
//   }
//
//   //_________________________________________TOP SLIDER CARD
//  Widget topSliderCard(Size size, String imgurl) {
//     return Container(
//       width: size.width * 0.9,
//       height: 200,
//       margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//       child: ClipRRect(
//           borderRadius: BorderRadius.circular(15),
//           child: Image.network(imgurl
//                  // 'https://firebasestorage.googleapis.com/v0/b/music-3137e.appspot.com/o/Asd.musicApp?alt=media&token=5f5f4d5a-a99d-4c16-9c30-11e245970849'  // imgurl,
//            , fit: BoxFit.fill,
//           )),
//     );
//   }
// }

//________________________________________PLAY BUTTON SECTION

class PlayButtonSection extends StatefulWidget {
  const PlayButtonSection({Key? key}) : super(key: key);

  @override
  State<PlayButtonSection> createState() => _PlayButtonSectionState();
}

class _PlayButtonSectionState extends State<PlayButtonSection> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.grey[400],
      child: const Icon(Icons.play_arrow, size: 40, color: Colors.black),
    );
  }
}

//_____________________________________PLAY LIST SECTION

class PlayListSection extends StatefulWidget {
  const PlayListSection({Key? key}) : super(key: key);

  @override
  State<PlayListSection> createState() => _PlayListSectionState();
}

class _PlayListSectionState extends State<PlayListSection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        playlistText(),
        SizedBox(
          height: 150,
          width: double.infinity,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) {
                return playlistContainer(size, 'images/playlist1.jpg');
              }),
        )
      ],
    );
  }

//_____PLAYLIST TEXT
  playlistText() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        'Play List',
        style:
            GoogleFonts.josefinSans(fontSize: 20, fontWeight: FontWeight.w800),
      ),
    );
  }

  //______PLAYLIST CONTAINER
  playlistContainer(Size size, imgurl) {
    return Container(
      width: size.width * 0.3,
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            imgurl,
            fit: BoxFit.fill,
          )),
    );
  }
}

//_____________________________________________MEW ALBUM SECTION

class NewAlbumSection extends StatelessWidget {
  const NewAlbumSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            newAlbumText(size),
            newAlbumCard(
                'images/newalbum1.jpg', 'Emanual Bet Younan', 'Maneela', size),
            newAlbumCard(
                'images/newalbum2.jpg', 'Emanual Bet Younan', 'Maneela', size),
            newAlbumCard(
                'images/newalbum3.jpg', 'Emanual Bet Younan', 'Maneela', size)
          ],
        ),
      ),
    );
  }

  //_______________NEW ALBUM TEXT

  newAlbumText(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'New Album',
          style: GoogleFonts.josefinSans(
              fontSize: 20, fontWeight: FontWeight.w800),
        ),
        InkWell(
          onTap: () {
            Get.to(const AlbumDetilView(),
                duration: const Duration(milliseconds: 500),
                transition: Transition.upToDown);
          },
          child: Text(
            'View More+',
            style: GoogleFonts.josefinSans(
                fontSize: 18, fontWeight: FontWeight.w800, color: Colors.red),
          ),
        ),
      ],
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

//_____________________________________________MEW SONG SECTION

class NewSongSection extends StatelessWidget {
  const NewSongSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            newSongText(size),
            newAlbumCard(
                'images/singer3.jpg', 'Emanual Bet Younan', 'Maneela', size),
            newAlbumCard(
                'images/singer4.jpg', 'Emanual Bet Younan', 'Maneela', size),
            newAlbumCard(
                'images/singer3.jpg', 'Emanual Bet Younan', 'Maneela', size),
            newAlbumCard(
                'images/singer4.jpg', 'Emanual Bet Younan', 'Maneela', size),
            newAlbumCard(
                'images/singer3.jpg', 'Emanual Bet Younan', 'Maneela', size),
            newAlbumCard(
                'images/singer4.jpg', 'Emanual Bet Younan', 'Maneela', size),
          ],
        ),
      ),
    );
  }

  //_______________NEW SONG TEXT

  newSongText(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'New Songs',
          style: GoogleFonts.josefinSans(
              fontSize: 20, fontWeight: FontWeight.w800),
        ),
        InkWell(
          onTap: () {
            Get.to(const SongDetailView(),
                duration: const Duration(milliseconds: 500),
                transition: Transition.upToDown);
          },
          child: Text(
            'View More+',
            style: GoogleFonts.josefinSans(
                fontSize: 18, fontWeight: FontWeight.w800, color: Colors.red),
          ),
        ),
      ],
    );
  }

  // ! _________________________NEWSONG CARD

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
            ],
          )
        ],
      ),
    );
  }
}
