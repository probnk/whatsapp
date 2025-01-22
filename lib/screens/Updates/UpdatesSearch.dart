import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/ReuseWidgets/SearchField.dart';
import 'package:whatsapp/ReuseWidgets/UpdateWidget.dart';

class UpdateSearch extends StatelessWidget {
  UpdateSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchFieldAppBar(context),
      backgroundColor: grey,
      body: body(context),
    );
  }
}
