import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:whatsapp/ReuseWidgets/Camera.dart';
import 'package:whatsapp/ReuseWidgets/UpdateWidget.dart';
import 'package:whatsapp/screens/Updates/UpdatesSearch.dart';

import '../../Constants/Colors.dart';
import '../../ReuseWidgets/PopMenu.dart';
import '../Setting/Setting.dart';

class Updates extends StatefulWidget {
  const Updates({super.key});

  @override
  State<Updates> createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {

  var _screens = [Setting()];
  var text = ["Setting"];
  _appbar(){
    return AppBar(
      backgroundColor: grey,
      leadingWidth: MediaQuery.of(context).size.width,
      leading:  SafeArea(
        child: Container(
            padding: EdgeInsets.only(left: 15,right: 15),
            color: grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Updates",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   CameraWidget(color: Color(0xffffffff)),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateSearch()));
                      },
                      icon: Icon(IconlyLight.search,color: Colors.white,size: 22),
                    ),
                    popMenuItems(context: context,option: text,size: text.length,screens: _screens)
                  ],
                )
              ],
            )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: updateFloatingButton(bottom: 120),
        appBar: _appbar(),
        backgroundColor: grey,
        body:body(context)
    );
  }
}
