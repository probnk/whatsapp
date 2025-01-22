import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/ReuseWidgets/Camera.dart';
import 'package:whatsapp/ReuseWidgets/PopMenu.dart';
import 'package:whatsapp/screens/Home/Home%20Menu%20Screens/Linked%20Devices/LinkedDevices.dart';
import 'package:whatsapp/screens/Home/Home%20Menu%20Screens/New%20Broadcast/NewBroadcast.dart';
import 'package:whatsapp/screens/Home/Home%20Menu%20Screens/New%20Group/NewGroup.dart';
import 'package:whatsapp/screens/Home/Home%20Menu%20Screens/Starred%20Messages/StarredMessages.dart';
import 'package:whatsapp/screens/Setting/Setting.dart';
import '../../ReuseWidgets/HomeWidget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List options = ["New group","New broadcast","Linked devices","Starred messages","Setting"];
  var _screens = [NewGroup(),NewBroadcast(),LinkedDevices(),StarredMessages(),Setting()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: homeFloatingButton(bottom: 120,context: context),
      appBar: AppBar(
        backgroundColor: Color(0xff0B141B),
        leadingWidth: MediaQuery.of(context).size.width,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("WhatsApp",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CameraWidget(color: Color(0xffffffff)),
                  popMenuItems(
                      option: options,
                      size: options.length,
                      context: context,
                      screens: _screens
                  )
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: grey,
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          searchMetaAI(context),
          SizedBox(height: 20,),
          listTile(context),
          SizedBox(height: 20,),
          encryptedmessage(),
          SizedBox(height: 250,)
        ],
      ),
    );
  }
}