// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_hub/Controller/setting_controller.dart';
import 'package:get/get.dart';
import 'package:music_hub/View/Screens/Authentication/login_view.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String userName = 'Your Name';
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const TopImageSection(),
          mySpace(size.height * 0.03),
          NameSection(name: userName),
          const Expanded(child: BottomSettingSection()),
        ],
      )),
    );
  }

  mySpace(double siz) {
    return SizedBox(
      height: siz,
    );
  }
}

//_____________________________________________TOP IMAGE SECTION

class TopImageSection extends StatelessWidget {
  const TopImageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          child: Image.asset(
            'images/singer2.jpg',
            fit: BoxFit.fill,
          ),
        ));
  }
}

//____________________________________________NAME SECTION

class NameSection extends StatelessWidget {
  NameSection({Key? key, required this.name}) : super(key: key);

  String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: GoogleFonts.josefinSans(
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            'Edit Photo',
            style: GoogleFonts.josefinSans(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}

//__________________________________________________BOTTOM SETTING SECTION

class BottomSettingSection extends StatelessWidget {
  const BottomSettingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.put(SettingController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: [
          //dark mood
          InkWell(
            onTap: () {},
            child: forDarkMood(
                Icons.dark_mode, 'Dark Mood', controller.isDark, controller),
          ),
          //privacy
          InkWell(
            onTap: () {},
            child: settingCard(Icons.lock, 'Privacy'),
          ),

          //Share
          InkWell(
            onTap: () {},
            child: settingCard(Icons.share, 'Share'),
          ),
          const Divider(
            color: Color.fromARGB(255, 223, 219, 219),
            indent: 5,
            height: 0,
            thickness: 0.5,
          ),
          //Notification
          InkWell(
            onTap: () {},
            child: settingCard(Icons.notifications, 'Notification'),
          ),

          //FeedBack
          InkWell(
            onTap: () {},
            child: settingCard(Icons.feedback, 'Feedback'),
          ),

          //Help
          InkWell(
            onTap: () {},
            child: settingCard(Icons.help_outline, 'Help'),
          ),

          const Divider(
            color: Color.fromARGB(255, 223, 219, 219),
            indent: 5,
            height: 0,
            thickness: 0.5,
          ),

          //Term Service
          InkWell(
            onTap: () {},
            child: settingCard(Icons.rule, 'Term & Condition'),
          ),

          //Privacy Plicy
          InkWell(
            onTap: () {},
            child: settingCard(Icons.policy, 'Term & Condition'),
          ),

          const Divider(
            color: Color.fromARGB(255, 223, 219, 219),
            indent: 5,
            height: 0,
            thickness: 0.5,
          ),
          //Logout
          InkWell(
            onTap: () {
              Get.to(const LoginView());
            },
            child: settingCard(Icons.logout, 'Logout'),
          ),
        ],
      ),
    );
  }

//__________SETTING CARD
  settingCard(IconData icon, String settingName) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
        size: 20,
      ),
      title: Text(settingName),
    );
  }

  //__________SETTING CARD
  forDarkMood(IconData icon, String settingName, bool isDark,
      SettingController controller) {
    return GetBuilder<SettingController>(builder: (cont1) {
      return ListTile(
        leading: Icon(
          icon,
          color: Colors.black,
          size: 20,
        ),
        title: Text(settingName),
        trailing: Switch(
            activeColor: Colors.red,
            value: cont1.isDark,
            onChanged: (value) {
              controller.updateDarkMood(value);
              Get.changeTheme(
                Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
              );
            }),
      );
    });
  }
}
