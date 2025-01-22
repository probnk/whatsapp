import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/ReuseWidgets/settingAppbar.dart';
import 'package:whatsapp/ReuseWidgets/usersListTile.dart';

import '../../../../Constants/Colors.dart';

class LinkedDevices extends StatefulWidget {
  const LinkedDevices({super.key});

  @override
  State<LinkedDevices> createState() => _LinkedDevicesState();
}

class _LinkedDevicesState extends State<LinkedDevices> {

  List<Map<String?,dynamic>> items = [
    {'profileUrl':'assets/images/whatsapp.png','title':"Google Chrome(Windows)",'subTitle':'Last active ${DateFormat("MMM d, HH:mm").format(DateTime.now())}'},
    {'profileUrl':'assets/images/whatsapp.png','title':"Google Chrome(Windows)",'subTitle':'Last active ${DateFormat("MMM d, HH:mm").format(DateTime.now())}'},
    {'profileUrl':'assets/images/whatsapp.png','title':"Google Chrome(Windows)",'subTitle':'Last active ${DateFormat("MMM d, HH:mm").format(DateTime.now())}'},
    {'profileUrl':'assets/images/whatsapp.png','title':"Google Chrome(Windows)",'subTitle':'Last active ${DateFormat("MMM d, HH:mm").format(DateTime.now())}'}
  ];

  _linkedDevicesBody() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .4,
          color: grey,
          child: Column(
            children: [
              Divider(color: mediumGrey),
              SizedBox(height: 16,),
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("assets/images/link3.png"),
              ),
              SizedBox(height: 16),
              Text("Use WhatsApp on Web, Desktop, and other decivces.",
                  style: subTitle, textAlign: TextAlign.center),
              SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    elevation: 8,
                     padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .3),
                  ),
                  child: Text("Link a device",style: TextStyle(color: Colors.black),))
            ],
          ),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            children: [
              Text("Device Status",style: smallGrey),
              Text("Tap a device to log out.",style: subTitle),
              ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                child: userListTile(items: items, index: index, context: context));
              })
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 30),
            Icon(Icons.lock_outline_rounded,color: Colors.grey,size: 16,),
            SizedBox(width: 30),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Your personal messages are ',
                    style: smallGrey
                  ),
                  TextSpan(
                    text: "end-to-end",
                      style: smallGreen
                  ),
                  TextSpan(
                    text: "\nencrypted ",
                      style: smallGreen
                  ),
                  TextSpan(
                      text: 'on all your devices',
                      style: smallGrey
                  )
                ]
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: userProfileApp(context, "Linked devices"),
      body: _linkedDevicesBody(),
    );
  }
}
