import 'package:flutter/cupertino.dart';

class UpdateProvider with ChangeNotifier{
  bool _isExpanded = false;
  bool get isExpanded => _isExpanded;

  void showExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }
}