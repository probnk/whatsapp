import 'package:flutter/material.dart';
import 'package:whatsapp/Model/MessageModel.dart';

class MessageProvider with ChangeNotifier {
  bool _showCamera = false;
  bool _showSend = false;

  bool get showCamera => _showCamera;
  bool get showSend => _showSend;

  List<MessageModel> _messages = [];
  List<MessageModel> get messages => _messages;

  void toggleState(){
    notifyListeners();
  }



  void toggleCamera() {
    _showCamera = !_showCamera;
    notifyListeners();
  }

  void toggleSend() {
    _showSend = !_showSend;
    notifyListeners();
  }

  void addMessage(var message) {
    _messages.add(MessageModel.fromSnapshot(message));
    notifyListeners();
  }
}