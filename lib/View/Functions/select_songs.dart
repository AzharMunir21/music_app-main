import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

selectSongs() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['mp3'],
    allowMultiple: true,
  );
}
