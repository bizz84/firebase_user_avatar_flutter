import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  // Returns a [File] object pointing to the image that was picked.
  Future<PickedFile?> pickImage({required ImageSource source}) async {
    return ImagePicker().getImage(source: source); //platform.pickImage(source: source);
  }
}
