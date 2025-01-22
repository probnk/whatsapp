import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/ReuseWidgets/SearchField.dart';
import 'package:whatsapp/ReuseWidgets/newGroupFloatingActionButton.dart';
import 'package:whatsapp/ReuseWidgets/newGroupUsers.dart';

class SearchNewGroup extends StatefulWidget {
  const SearchNewGroup({super.key});

  @override
  State<SearchNewGroup> createState() => _SearchNewGroupState();
}

class _SearchNewGroupState extends State<SearchNewGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: searchFieldAppBar(context),
      floatingActionButton: newGroupFloatingButton(Icons.arrow_forward),
      body: NewGroupUser(),
    );
  }
}
