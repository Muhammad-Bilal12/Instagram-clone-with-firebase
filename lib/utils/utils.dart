import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

imagePicker(ImageSource source) async {
  final ImagePicker _img = ImagePicker();
  XFile? _file = await _img.pickImage(source: source);

  if (_file != null) {
    return await _file.readAsBytes();
  }
  print("No Image Found");
}

// msg snackbar

showSnackBar(BuildContext context, String content) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}
