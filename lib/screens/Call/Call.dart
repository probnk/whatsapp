import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/ReuseWidgets/CallWidget.dart';
import 'package:whatsapp/ReuseWidgets/Camera.dart';
import 'package:whatsapp/ReuseWidgets/PopMenu.dart';
import 'package:whatsapp/screens/Call/CallSearch.dart';
import 'package:whatsapp/screens/Setting/Setting.dart';
import '../../Constants/Colors.dart';

class Call extends StatefulWidget {
  const Call({super.key});

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {

  var option = ["Setting"];
  var _screens = [Setting()];

  callAppbar(){
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
                Text("Calls",
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CallSearch()));
                      },
                      icon: Icon(IconlyLight.search,color: Colors.white,size: 22),
                    ),
                    popMenuItems(context: context,size: option.length,option: option,screens: _screens)
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
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 116,right: 4),
          child: FloatingActionButton(
            onPressed: () {},
            elevation: 8,
            backgroundColor: green,
            tooltip: "Call",
            child: Icon(
              IconlyBold.call,
              color: Colors.black87,
              size: 27,
            )),
        ),
      appBar: callAppbar(),
      backgroundColor: grey,
      body: callBody()
    );
  }
}
