

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:open_file/open_file.dart';

class FilesPages extends StatefulWidget {
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpendFile;
  final Map<String, String>? result;
  FilesPages({
    required this.files,
    required this.onOpendFile, this.result,
    // required this.result,
  });

  @override
  State<FilesPages> createState() => _FilesPagesState();
}

class _FilesPagesState extends State<FilesPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Container(
            // margin: EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: 56,
            decoration: const BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                'Done',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ))
      ],
      appBar: AppBar(
        title: const Text('Selected audio'),
      ),
      body: Center(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: widget.files.length,
              itemBuilder: (context, index) {
                final file = widget.files[index];
                return buildFile(file);
              })),
    );
  }

  Widget buildFile(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final size = (mb >= 1)
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';

    return Container(
      color: Colors.amber,
      child: InkWell(
          onTap: () {
            OpenFile.open(file.path);
          },
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      file.extension.toString(),
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  file.name,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  file.size.toString(),
                  style: const TextStyle(fontSize: 18),
                )
              ],
            ),
          )),
    );
  }
}

// upload(fileName, filePath) {
//   _extension = fileName
//       .toString()
//       .split('.')
//       .last;
//   firebase_storage.Reference ref =
//   FirebaseStorage.instance.ref().child(fileName);
//   final UploadTask uploadTask = ref.putFile(
//       File(filePath);
//     // File(file.Path,fileName),
//     //   StorageMetadata   (
//     //   contentType: FileType.custom,
//     // ),
//
//   );
//   setState(() {
//     _tasks.add(uploadTask);
//   });
//   print(fileName);
// }
//
// uploadToFirebase() {
//   if (_multiPick) {
//     re.forEach((fileName, filePath) => {upload(fileName, filePath)});
//   } else {
//     String? fileName = _path
//         ?.split('/')
//         .last;
//     String? filePath = _path;
//     upload(fileName, filePath);
//   }
// }

// List<UploadTask> _tasks = <UploadTask>[];
// bool _multiPick = false;
// String? _extension;
// String? _path;
