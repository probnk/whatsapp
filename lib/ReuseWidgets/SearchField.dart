import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../Constants/Colors.dart';

searchFieldAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: grey,
    leadingWidth: MediaQuery.of(context).size.width-10,
    toolbarHeight: 80,
    leading: SafeArea(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 20,
          padding: EdgeInsets.only(top: 10,bottom: 15),
          color: Color(0xff0B141B),
          child:Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            width: MediaQuery.of(context).size.width-30,
            child: TextFormField(
              autofocus: true,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.grey.shade400,
              decoration: InputDecoration(
                fillColor: Colors.white30,
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color:Colors.transparent)
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon:IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon:Icon(IconlyLight.arrow_left,color: Colors.white,)
                ),
                hintText: "Search...",
                hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w400
                ),
              ),
            ),
          )
      ),
    ),
  );
}