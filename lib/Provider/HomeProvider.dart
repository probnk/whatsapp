import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier{
  bool _isShow = false;
  bool get isShow => _isShow;
  int _isIndex = 0;
  int get isIndex => _isIndex;

  void showReadButton() {
    _isShow = true;
    notifyListeners();
  }

  void selectIndex(int index) {
    _isIndex = index;
    notifyListeners();
  }

}