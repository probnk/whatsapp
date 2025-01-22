import 'dart:io';

import 'package:flutter/material.dart';
import 'package:whatsapp/Model/UserProfileModel.dart';

class UserProfileProvider with ChangeNotifier {
  UserProfileModel? _userProfile;
  bool _isLoading = true;

  UserProfileModel? get userProfile => _userProfile;
  bool get isLoading => _isLoading;
  String _productPhotoUrls = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";
  String get productPhotoUrls => _productPhotoUrls;
  File? _imageFile;
  File? get imageFile => _imageFile;

  void setImageFile(File image){
    _imageFile = image;
    notifyListeners();
  }

  void setProductPhoto( String url) {
    _productPhotoUrls = url;
    notifyListeners();
  }


  void toggleLoading(bool isTrue) {
    _isLoading = isTrue;
    notifyListeners();
  }

  void setUserData(UserProfileModel userProfile) {
    _userProfile = userProfile;
    notifyListeners();
  }

  void setName(String name) {
    _userProfile!.name = name;
    notifyListeners();
  }

  void setSlogan(String slogan) {
    _userProfile!.slogan = slogan;
    notifyListeners();
  }

  void setPhotoUrl(String photoUrl) {
    _userProfile!.photoUrl = photoUrl;
    notifyListeners();
  }
}