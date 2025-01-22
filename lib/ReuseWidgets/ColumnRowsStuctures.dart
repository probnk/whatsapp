import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Provider/Setting%20Provider.dart';

import '../Constants/Colors.dart';
import '../Constants/fonts.dart';

iconTitleList({var accountItems,var index, required bool isTrue,var newTitle,var icon,VoidCallback? onPressed}){
  return InkWell(
    onTap: onPressed,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(isTrue ? icon : accountItems[index]['icon'], color: textGrey, size: 28),
          SizedBox(width: 20,),
          Text(isTrue ? newTitle : accountItems[index]['title'], style: title),
        ],
      ),
    ),
  );
}

titleSubtitle({required BuildContext context ,var items,var index, required bool isTrue,var newTitle,var newSubTitle,VoidCallback? onPressed}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(isTrue ? newTitle : items[index]['title'],style: title),
      Container(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 100
          ),
          child: Text(isTrue ? newSubTitle : items[index]['subTitle'],style: subTitle))
    ],
  );
}

avatarTitleSubTitle({var screen,required BuildContext context ,var icons,var items,var index, required bool isTrue,var newTitle,var newSubTitle,VoidCallback? onPressed}) {
  return InkWell(
    onTap:isTrue ? onPressed : () { Navigator.push(
      context, MaterialPageRoute(builder: (context) => isTrue ? screen : screen[index]));
      },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(isTrue ? icons : items[index]['icon'], color: textGrey, size: 28),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(isTrue ? newTitle : items[index]['title'], style: title),
              Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 100),
                  child: Text(isTrue ? newSubTitle :items[index]['subtitle'], style: subTitle,
                    overflow: TextOverflow.ellipsis,
                  )
              ),
            ],
          )
        ],
      ),
    ),
  );
}