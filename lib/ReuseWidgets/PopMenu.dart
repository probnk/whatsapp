import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/Colors.dart';
import '../Constants/fonts.dart';

popMenuItems({List? option, int? size ,BuildContext? context,List<Widget>? screens}){
  return PopupMenuButton(
    color: Color(0xff2F3438),
    elevation: 0,
    icon: Icon(Icons.more_vert_rounded, color: Colors.white),
    itemBuilder: (context) => [
      for(int item = 0;item < size! ; item++)
        PopupMenuItem(
          value: item,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => screens![item]));
          },
          child: Text(option![item], style: menuBar),
        ),
    ],
  );
}