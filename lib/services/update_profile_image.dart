import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<void> updateProfileImage(BuildContext context) async {
  final ImagePicker _picker = ImagePicker();
  // Pick an image
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  print(image!.path);
}
