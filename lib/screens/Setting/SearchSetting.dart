import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/ReuseWidgets/SearchField.dart';
import 'package:whatsapp/ReuseWidgets/SettingBody.dart';

class SearchSetting extends StatefulWidget {
  const SearchSetting({super.key});

  @override
  State<SearchSetting> createState() => _SearchSettingState();
}

class _SearchSettingState extends State<SearchSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: searchFieldAppBar(context),
      body: SettingBody(),
    );
  }
}
