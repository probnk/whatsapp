import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/screens/Home/Home%20Menu%20Screens/New%20Group/SearchNewGroup.dart';
import '../Constants/Colors.dart';
import '../Constants/fonts.dart';

homeMenuAppbar(
    {required String newTitle,
    required String newSubTitle,
    required BuildContext context,
    required Widget screen}) {
  return AppBar(
    elevation: 0,
    backgroundColor: grey,
    leadingWidth: MediaQuery.of(context).size.width * .7,
    leading: appbarListTile(
        newTitle: newTitle, newSubTitle: newSubTitle, context: context),
    actions: [
      IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => screen));
          },
          icon: Icon(Icons.search_rounded, color: Colors.white, size: 30))
    ],
  );
}

appbarListTile(
    {required String newTitle,
    required String newSubTitle,
    required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white)
      ),
      SizedBox(
        width: 20,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(newTitle, style: title),
          Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 40),
              child: Text(newSubTitle, style: smallWhite, overflow: TextOverflow.ellipsis,)
          ),
        ],
      )
    ],
  );
}
