import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/ReuseWidgets/SearchField.dart';
import 'package:whatsapp/ReuseWidgets/newGroupFloatingActionButton.dart';

class SearchBroadcast extends StatefulWidget {
  const SearchBroadcast({super.key});

  @override
  State<SearchBroadcast> createState() => _SearchBroadcastState();
}

class _SearchBroadcastState extends State<SearchBroadcast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: searchFieldAppBar(context),
      floatingActionButton: newGroupFloatingButton(Icons.done_rounded),
    );
  }
}
