import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  Future<File> pickImage() async {
    // TODO: User ImageSource.camera for production
    return ImagePicker.pickImage(source: ImageSource.gallery);
  }
}
