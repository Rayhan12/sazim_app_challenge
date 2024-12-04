import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';



class FileUploaderController with ChangeNotifier {
  XFile imageFile = XFile("");

  bool uploadObjectReady = false;

  Future<void> setImageFile({required XFile selectedFile}) async {
    imageFile = selectedFile;
    uploadObjectReady = true;
    notifyListeners();
  }

  void clearController() {
    imageFile = XFile("");
    uploadObjectReady = false;
    notifyListeners();
  }



  bool hasImageFile() {
    return imageFile.path.isNotEmpty && !(imageFile.path.compareTo("") == 0);
  }


}