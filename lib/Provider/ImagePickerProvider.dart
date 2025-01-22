import 'dart:io';

import 'package:flutter/cupertino.dart';

class ImagePickerProvider extends ChangeNotifier{
  File? _imageFile;
  File? get imageFile => _imageFile;

  void setImage(File image){
    _imageFile = image;
    notifyListeners();
  }
}