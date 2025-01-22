import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/ReuseWidgets/ColumnRowsStuctures.dart';
import 'package:whatsapp/ReuseWidgets/SwitchButton.dart';
import 'package:whatsapp/ReuseWidgets/settingAppbar.dart';
import '../../../Provider/Setting Provider.dart';

class Privacy extends StatefulWidget {
  const Privacy({super.key});

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {

  List<Map<String?,dynamic>> _privacyItems= [
    {"title":"Last seen and online",'subTitle':"Nobody, Everyone"},
    {"title":"Profile photo",'subTitle':"My contacts"},
    {"title":"About",'subTitle':"My contacts"},
    {"title":"Status",'subTitle':"My contacts"}
  ];

  List<Map<String?,dynamic>> groupItems= [
    {"title":"Live location",'subTitle':"None"},
    {"title":"Call",'subTitle':"Silence unknown callers"},
    {"title":"Blocked contacts",'subTitle':"9"},
    {"title":"App lock",'subTitle':"Disabled"},
    {"title":"Chat lock",'subTitle':""},
    {"title":"Advanced",'subTitle':"Protect IP address in calls, Disable link previews"}
  ];

  _privacyBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: ListView(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: [
          Divider(color: mediumGrey),
          SizedBox(height: 20),
          Text("Who can see my personal info",style: subTitle),
          SizedBox(height: 20),
          _permissionList(_privacyItems),
          readReceipts(),
          SizedBox(height: 20,),
          Divider(color: mediumGrey),
          SizedBox(height: 20,),
          Text("Disappearing messages",style: subTitle),
          SizedBox(height: 16),
          disappearingMessages(),
          Text("Groups"),
          SizedBox(height: 10),
          _permissionList(groupItems)
        ],
      ),
    );
  }

  disappearingMessages(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        titleSubtitle(
            context: context, isTrue: true,
            newTitle: "Default message timer",
            newSubTitle: "Start new chats with disappearing messages set to your timer"
        ),
        TextButton(onPressed: () {}, child: Text("Off",style: subTitle,))
      ],
    );
  }


  readReceipts(){
    return SettingsRow(
        isDark: true,
        newTitle:"Read Receipts" ,
        newSubTitle:"If turned off, you won't sne or receive Read receipts."
            "Read receipts are always sent for groups chats." ,
        providerValue: context.watch<SettingProvider>().allowRead,
        onChanged: (newValue){
          context.read<SettingProvider>().toggleAllowReceipt(newValue);
        });
  }
  _permissionList(List<Map<String?,dynamic>> items) {
    return ListView.builder(
        itemCount: items.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context,index){
          return Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: titleSubtitle(context: context, isTrue: false,items: items,index: index)
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: grey,
        appBar: userProfileApp(context, "Privacy"),
        body:_privacyBody()
    );
  }
}