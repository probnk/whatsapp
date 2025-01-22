import 'package:flutter/material.dart';
import 'package:whatsapp/ReuseWidgets/ColumnRowsStuctures.dart';

userListTile({required List<Map<String?,dynamic>> items,required int index,required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      CircleAvatar(
        radius: 24,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(items[index]['profileUrl']),
      ),
      SizedBox(width: 20),
      titleSubtitle(context: context, isTrue: true,newTitle:items[index]['title'],newSubTitle: items[index]['subTitle'] )
    ],
  );
}
