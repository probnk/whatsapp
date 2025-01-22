import 'package:flutter/cupertino.dart';
import '../Model/UserProfileModel.dart';

class ContactProvider with ChangeNotifier{
  List<UserProfileModel>? _userProfileModel = [];
  List<UserProfileModel>? get userProfileModel => _userProfileModel;

  void setAllContacts(UserProfileModel list){
    _userProfileModel!.add(list);
    notifyListeners();
  }
}