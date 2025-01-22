import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/ReuseWidgets/settingAppbar.dart';

import '../../../ReuseWidgets/inviteList.dart';

class InviteFriend extends StatefulWidget {
  const InviteFriend({super.key});

  @override
  State<InviteFriend> createState() => _InviteFriendState();
}

class _InviteFriendState extends State<InviteFriend> {

  _inviteFriendBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: [
          Divider(color: mediumGrey),
          SizedBox(height: 10),
          _shareLink(),
          SizedBox(height: 20),
          Text("From Contacts",style: subTitle),
          SizedBox(height: 16),
          inviteList()
        ],
      ),
    );
  }

  _shareLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: green,
              shape: BoxShape.circle
          ),
          child: Icon(Icons.share_outlined,size: 30,),
        ),
        SizedBox(width: 10),
        Text("Share link",style: title)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: settingAppbar(context, "Invite a friend",InviteFriend()),
      body: _inviteFriendBody(),
    );
  }
}