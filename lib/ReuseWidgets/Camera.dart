import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';

class CameraWidget extends StatefulWidget {
  final Color color;
  CameraWidget({required this.color});
  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  File? _selectedImage;

  Future<void> _showCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile!= null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Camera rebuilt");
    return IconButton(
      onPressed: _showCamera,
      icon: Icon(IconlyLight.camera,color: widget.color),
    );
  }
}