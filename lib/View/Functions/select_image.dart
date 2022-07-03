import 'dart:io';

import 'package:image_picker/image_picker.dart';

selectImage() async {
  // final result = await FilePicker.platform
  //     .pickFiles(allowMultiple: false, allowedExtensions: ['jpg', 'png']);
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  if (image == null) return;
  final path = image.path;
  return File(path);
}
// selectSongs() async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles(
//     type: FileType.custom,
//     allowedExtensions: ['mp3','mp4'],
//     allowMultiple: true,
//   );
// }
