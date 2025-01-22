import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/ReuseWidgets/HomeMenuAppbar.dart';
import 'package:whatsapp/ReuseWidgets/newGroupFloatingActionButton.dart';
import 'package:whatsapp/ReuseWidgets/newGroupUsers.dart';
import 'package:whatsapp/screens/Home/Home%20Menu%20Screens/New%20Group/SearchNewGroup.dart';

class NewGroup extends StatefulWidget {
  const NewGroup({super.key});

  @override
  State<NewGroup> createState() => _NewGroupState();
}

class _NewGroupState extends State<NewGroup> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: grey,
      floatingActionButton:  newGroupFloatingButton(Icons.arrow_forward),
      appBar: homeMenuAppbar(
        screen: SearchNewGroup(),
          newTitle: "New group",
          newSubTitle: "Add members",
          context: context),
      body: NewGroupUser(),
    );
  }
}
