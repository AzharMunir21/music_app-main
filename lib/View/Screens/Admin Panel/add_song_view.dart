import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_hub/View/Functions/select_image.dart';
import 'package:music_hub/View/Screens/Admin%20Panel/upload_song_view.dart';
import 'package:open_file/open_file.dart';
import '../../../Controller/album_controller.dart';
import '../../../Controller/song_controller.dart';

import '../../Widgets/text_field.dart';
import '../../Widgets/text_widget.dart';
import 'package:path/path.dart';

class AddSongViewForm extends StatefulWidget {
  const AddSongViewForm({Key? key}) : super(key: key);

  @override
  State<AddSongViewForm> createState() => _AddSongViewFormState();
}

class _AddSongViewFormState extends State<AddSongViewForm> {
  AlbumController controllerr = Get.put(AlbumController());
  // List<PlatformFile> file= [];
  // final List<UploadTask> _tasks = <UploadTask>[];
  // bool _multiPick = false;
  // String? _extension;
  // Map<String, String>? result;
  // String? _path;

     String? urlDownload;
  var percentage;

  bool values = false;
  UploadTask? task;
  File? file;

  void initState() {
    if (percentage == 100) {
      setState(() {
        values = false;
        percentage = 0 as String;
      });
    }
  }

  SongController controller = Get.put(SongController());

  @override
  Widget build(BuildContext context) {
    // TextEditingController controllerforSingerName = TextEditingController();
    // TextEditingController controllerforSongName = TextEditingController();
    // SongController controller = Get.put(SongController());

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
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                redHeader('ADD SONGS'),
                SizedBox(
                  height: size.height * 0.1,
                ),
//
                //________________________IMAGE SELECTTION
                InkWell(onTap: () async {
                  File? imageFile = await selectImage();
                  final value = Get.find<SongController>();
                  value.getImage(imageFile!);
                  imageFile = value.imageFile;
                  print(basename(imageFile!.path));
                }, child: GetBuilder<SongController>(
                  builder: (value) {
                    return CircleAvatar(
                      backgroundColor: Colors.white,
                      // backgroundImage: ,
                      radius: 50,
                      // backgroundImage:AssetImage(),
                      child: value.imageFile == null
                          ? const Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                            )
                          : Image.file(
                              value.imageFile!,
                              fit:BoxFit.fill,
                            ),
                    );
                  },
                )),

//              singerImagePortion(),
                SizedBox(
                  height: size.height * 0.009,
                ),
                Text(
                  'Singer Image',
                  style: GoogleFonts.josefinSans(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SingerNamePortion(controller.controllerforSingerName),
                SizedBox(
                  height: size.height * 0.03,
                ),
                songNamePortion(controller.controllerforSongName),
                SizedBox(
                  height: size.height * 0.03,
                ),
                selectAlbumPortion(),
                SizedBox(
                  height: size.height * 0.03,
                ),
                selectSongPortion(),
                SizedBox(
                  height: size.height * 0.04,
                ),
                buttonPortion(),
                Container(height: 30),
                task != null ? buildUploadStatus(task!) : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

// //______________________________________IMAGE PORTION
  singerImagePortion() {
    return const CircleAvatar(
      backgroundColor: Colors.white,
      radius: 50,
      child: Icon(Icons.photo),
    );
  }

//   //___________________________________SINGER NAME PORTION
  SingerNamePortion(TextEditingController controller) {
    return MyTextField(
        'Enter Singer Name', const Icon(Icons.person), controller);
  }

//   //___________________________________SONG NAME PORTION
  songNamePortion(TextEditingController controller) {
    return MyTextField('Enter Song Name',
        const Icon(Icons.my_library_music_sharp), controller);
  }

//   //___________________________________SELECT ALBUM PORTION
  selectAlbumPortion() {
    // SongController controller = Get.put(SongController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        heading4('Select Album'),
        Container(
            height: 40,
            width: 150,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 228, 27, 13),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child:
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  dropdownColor: Colors.redAccent,
                  items:
                  Get.find<SongController>().albumList!.map((SelectedType)  {
                    return DropdownMenuItem(
                      value: SelectedType,
                      child: Text(SelectedType,
                          style: GoogleFonts.josefinSans(
                              fontSize: 14, color: Colors.white)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    var controller = Get.find<SongController>();
                    controller.setSelectedAlbum(value.toString());
                    // setState(() {});
                  },
                  value: controller.selectAlbum,
                ),
              ),
            ))
      ],
    );
  }

//   //___________________________________SELECT SONGS PORTION
  selectSongPortion() {
    // SongController controller = Get.put(SongController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        values
            ? Expanded(
                child: AnimatedTextKit(totalRepeatCount: 40, animatedTexts: [
                RotateAnimatedText(
                  file != null ? basename(file!.path) : 'No File Selected',
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )
              ])) //HomeView()
            : heading4('Select Songs'),
        InkWell(
          onTap: () async {
            selectFile();

            // var result = await FilePicker.platform.pickFiles(
            //   // allowMultiple: true,
            //   type: FileType.custom,
            //   allowedExtensions: [
            //     'mp3',
            //   ],
            // );
            //
            //
            // if (result == null) return;
            //
            // openFiles(result.files);
          },
          child: Container(
            height: 40,
            width: 150,
            margin: EdgeInsets.only(top: 16, bottom: 16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 228, 27, 13),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: heading4('Select Songs'),
            ),
          ),
        )
      ],
    );
  }

//   //___________________________________BUTTON PORTION
  buttonPortion() {
    return InkWell(
      onTap: () {
        uploadFile();

        final value = Get.find<SongController>();
        String singerName = controller.controllerforSingerName.text;
        String songName = controller.controllerforSongName.text;
        value.UploadSongData(singerName, songName, urlDownload);
        // value.geAlbumName(singerName,songName,urlDownload,);
        //creatSongCollection(singerName,songName,);
        // print(urlDownload);
      },
      //uploadToFirebase(),

      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 228, 27, 13),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: heading4('Upload Songs'),
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: [
        'mp3',
      ],
    );

    if (result == null) return;
    final path = result.files.single.path!;
    setState(() {
      file = File(path);

      values = true;
    });
    // setState(() = file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            percentage = (progress * 100).toStringAsFixed(2);

            if (percentage == 100) {
              setState(() {
                values = false;
                percentage = 0 as String;
              });
            }

            return Text(
              '$percentage %',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            );
          } else {
            return Container();
          }
        },
      );
}

// //   //___________________________________file open portion
//   void openFiles(List<PlatformFile> files) {
//     Get.to(FilesPages(
//       onOpendFile: openFile,
//       files: files,
//       // result: result
//     ));
//   }
//
//   void openFile(PlatformFile files) {
//     OpenFile.open(files.path);
//   }
// }

//
//
// print("Name: ${file.name}");
// print("Bytes: ${file.bytes}");
// print("Name: ${file.size}");
// print("Name: ${file.extension}");
// print("Path: ${file.path}");
// // final newFile=   await saveFilePermanently(file);
//    print("Path: ${file.name}");
// print("Path: ${newFile.name}");

// uploadToFirebase() {
//   if (_multiPick) {
//
//
//     result?.forEach((fileName, filePath) => {upload(fileName, filePath)});
//
//   } else {
//     String? fileName = _path?.split('/').last;
//     String? filePath = _path;
//     upload(fileName, filePath);
//   }

// }
// upload(fileName, filePath) {
//   _extension = fileName.toString().split('.').last;
//   firebase_storage.Reference ref =
//   FirebaseStorage.instance.ref().child(fileName);
//   final UploadTask uploadTask = ref.putFile(
//     File(filePath),
//     //   StorageMetadata   (
//     //   contentType: FileType.custom,
//     // ),
//
//   );
//   setState(() {
//     _tasks.add(uploadTask);
//   });  print(fileName);
// }
