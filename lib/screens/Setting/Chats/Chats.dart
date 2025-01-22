import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/Provider/Setting%20Provider.dart';
import 'package:whatsapp/ReuseWidgets/ColumnRowsStuctures.dart';
import 'package:whatsapp/ReuseWidgets/SwitchButton.dart';
import 'package:whatsapp/ReuseWidgets/settingAppbar.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {

  _chatBody() {
    return ListView(
      children: [
        Divider(color: mediumGrey),
        display(),
        Divider(color: mediumGrey),
        chatSetting(),
        Divider(color: mediumGrey),
        Padding(
          padding: const EdgeInsets.only(left: 16,top: 16),
          child: Text("Archived chats",style: subTitle),
        ),
        archivedChats(),
        Divider(color: mediumGrey),
        _bottomItems()
      ],
    );
  }

  display() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Display",style: subTitle),
          SizedBox(height: 16),
          avatarTitleSubTitle(context: context, isTrue: true,newTitle: "Theme",newSubTitle: "Dark",icons: Icons.brightness_6_outlined),
          SizedBox(height: 20),
          iconTitleList(isTrue: true,icon:Icons.wallpaper_rounded,newTitle: "Wallpaper" )
        ],
      ),
    );
  }

  chatSetting() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Chat Setting", style: subTitle),
          SizedBox(height: 16),
          SettingsRow(
            isDark: true,
            newTitle: "Enter is send",
            newSubTitle: "Enter key will send your message",
            providerValue: context.watch<SettingProvider>().allowSend,
            onChanged: (newValue) {
              context.read<SettingProvider>().toggleSend(newValue);
            },
          ),
          SizedBox(height: 20,),
          SettingsRow(
            isDark: true,
            newTitle: "Media visibility",
            newSubTitle: "Show newly downloaded media in your device's gallery",
            providerValue: context.watch<SettingProvider>().allowMediaVisibility,
            onChanged: (newValue) {
              context.read<SettingProvider>().toggleMediaVisibility(newValue);
            },
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Font size", style: title),
                Text("Medium", style: subTitle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _bottomItems(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          iconTitleList(isTrue: true,icon:Icons.cloud_upload_outlined,newTitle: "Chat backup" ),
          iconTitleList(isTrue: true,icon:Icons.mobile_screen_share_rounded,newTitle: "Transfer chats" ),
          iconTitleList(isTrue: true,icon:Icons.timelapse_sharp,newTitle: "Chat history" )
        ],
      ),
    );
  }

  archivedChats() {
    return SettingsRow(
        isDark: true,
        newTitle: "Keep chats archived",
        newSubTitle: "Archived chats will remain archived when you receive a new message",
        providerValue: context.watch<SettingProvider>().allowArchived,
        onChanged: (newValue) {
          context.read<SettingProvider>().toggleAllowArchived(newValue);
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: userProfileApp(context, "Chats"),
      body: _chatBody(),
    );
  }
}