import 'package:flutter/material.dart';
import 'package:whatsapp/ReuseWidgets/SearchField.dart';

import '../Constants/Colors.dart';
import '../Constants/fonts.dart';

userProfileApp(BuildContext context,String appbarTitle) {
  return AppBar(
    backgroundColor: grey,
    leadingWidth: MediaQuery.of(context).size.width - 100,
    leading: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.white)),
        Text(appbarTitle, style: status)
      ],
    ),
  );
}
settingAppbar(BuildContext context,String newTitle ,Widget screen) {
  return AppBar(
    backgroundColor: grey,
    leadingWidth: MediaQuery.of(context).size.width - 150,
    leading: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.white)),
        Text(newTitle, style: status)
      ],
    ),
    actions: [
      IconButton(
          onPressed: () {
           Navigator.push(context,MaterialPageRoute(builder: (context) => screen));
          }, icon: Icon(Icons.search, color: Colors.white)),
    ],
  );
}