import 'package:flutter/cupertino.dart';

class UpdateProvider with ChangeNotifier{
  bool _isSearch = true;
  bool get isSearch => _isSearch;
  bool _isExpanded = false;
  bool get isExpanded => _isExpanded;

  void showSearchField() {
   _isSearch = !_isSearch;
   notifyListeners();
  }

  void showExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }
}