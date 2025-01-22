import 'package:flutter/material.dart';
import '../Constants/Colors.dart';

newGroupFloatingButton(IconData icons) {
  return FloatingActionButton(
      onPressed: () {},
      elevation: 16,
      backgroundColor: green,
      tooltip: "Create Group",
      child: Icon(
        icons,
        color: Colors.black87,
      ));
}
