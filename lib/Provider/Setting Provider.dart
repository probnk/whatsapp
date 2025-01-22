import 'package:flutter/cupertino.dart';

class SettingProvider with ChangeNotifier{
  bool _allowSend = false;
  bool get allowSend => _allowSend;

  bool _allowMediaVisibility = false;
  bool get allowMediaVisibility => _allowMediaVisibility;

  bool _allowArchived = false;
  bool get allowArchived => _allowArchived;

  bool _allowRead = false;
  bool get allowRead => _allowRead;

  bool _allowConversationTones = false;
  bool get allowConversationTones => _allowConversationTones;

  bool _allowMessageHighPriority = false;
  bool get allowMessageHighPriority => _allowMessageHighPriority;

  bool _allowMessageNotificationReaction = false;
  bool get allowMessageNotificationReaction => _allowMessageNotificationReaction;

  bool _allowGroupHighPriority = false;
  bool get allowGroupHighPriority => _allowGroupHighPriority;

  bool _allowGroupNotificationReaction = false;
  bool get allowGroupNotificationReaction => _allowGroupNotificationReaction;

  bool _useLessCallData = false;
  bool get useLessCallData => _useLessCallData;

  int  _selectedLanguage = 0;
  int get  selectedLanguage =>  _selectedLanguage;

  bool _isChecked = false;
  bool get isChecked => _isChecked;

  String _qrCodeData = "Umar Farooq";
  String get qrCodeData => _qrCodeData;

  bool _AutoUpdateWhatsApp = false;
  bool get AutoUpdateWhatsApp => _AutoUpdateWhatsApp;

  bool _UpdateOverCellular = false;
  bool get UpdateOverCellular => _UpdateOverCellular;

  bool _getNotifiedByWhatsApp = false;
  bool get getNotifiedByWhatsApp => _getNotifiedByWhatsApp;

  void allowAutoUpdateWhatsApp(bool newValue){
    _AutoUpdateWhatsApp = newValue;
    notifyListeners();
  }

  void allowUpdateOverCellular(bool newValue){
    _UpdateOverCellular = newValue;
    notifyListeners();
  }

  void allowGetNotifiedByWhatsApp(bool newValue){
    _getNotifiedByWhatsApp = newValue;
    notifyListeners();
  }

  void getQRCodeData(String code) {
    _qrCodeData = code;
    notifyListeners();
  }

  void setIsChecked(bool newValue){
    _isChecked = newValue;
    notifyListeners();
  }

  void toggleSelectedLanguage(int newValue){
    _selectedLanguage = newValue;
    notifyListeners();
  }

  void toggleUseLessCallData(bool value){
    _useLessCallData = value;
    notifyListeners();
  }

  void toggleAllowGroupHighPriority(bool value){
    _allowGroupHighPriority = value;
    notifyListeners();
  }

  void toggleAllowGroupNotificationReaction(bool value){
    _allowGroupNotificationReaction = value;
    notifyListeners();
  }

  void toggleAllowMessageHighPriority(bool value){
    _allowMessageHighPriority = value;
    notifyListeners();
  }

  void toggleAllowMessageNotificationReaction(bool value){
    _allowMessageNotificationReaction = value;
    notifyListeners();
  }

  void toggleAllowConversationTones(bool value){
    _allowConversationTones = value;
    notifyListeners();
  }

  void toggleAllowReceipt(bool value){
    _allowRead = value;
    notifyListeners();
  }

  void toggleSend(bool value){
    _allowSend = value;
    notifyListeners();
  }

  void toggleMediaVisibility(bool value){
    _allowMediaVisibility = value;
    notifyListeners();
  }

  void toggleAllowArchived(bool value){
    _allowArchived = value;
    notifyListeners();
  }
}