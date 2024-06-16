import 'package:flutter/cupertino.dart';

class BottomNavProvider with ChangeNotifier{
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void changeScreen(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}