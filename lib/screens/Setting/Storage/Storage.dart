import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/Provider/Setting%20Provider.dart';
import 'package:whatsapp/ReuseWidgets/ColumnRowsStuctures.dart';
import 'package:whatsapp/ReuseWidgets/SwitchButton.dart';
import 'package:whatsapp/ReuseWidgets/settingAppbar.dart';

class Storage extends StatefulWidget {
  const Storage({super.key});

  @override
  State<Storage> createState() => _StorageState();
}

class _StorageState extends State<Storage> {

  _settingStorage() {
    return ListView(
      children: [
        Divider(color: mediumGrey),
        avatarTitleSubTitle(context: context, isTrue: true,
            icons: Icons.file_copy_outlined,
            newTitle: "Manage storage",newSubTitle: "6.4 GB"
        ),
        Divider(color: mediumGrey),
        avatarTitleSubTitle(context: context, isTrue: true,
            icons: Icons.data_usage_rounded,
            newTitle: "Network usage",newSubTitle: "1.5 GB sent . 10.8 GB received"
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Use less data for calls",style: title),
            SizedBox(width: 30),
            SettingsRow(
                isDark: true,
                newTitle: "", newSubTitle: "",
                providerValue: context.watch<SettingProvider>().useLessCallData,
                onChanged: (newValue){
                  context.read<SettingProvider>().toggleUseLessCallData(newValue);
                }
            ),
          ],
        ),
        Padding(
            padding: EdgeInsets.only(left: 70),
          child:titleSubtitle(context: context, isTrue: true,
              newTitle: "Proxy",newSubTitle: "Off")
        ),
        SizedBox(height: 10),
        Divider(color: mediumGrey),
        avatarTitleSubTitle(context: context, isTrue: true,
            icons: Icons.hdr_auto_select,
            newTitle: "Media upload quality",newSubTitle: "Standard quality"
        ),
        Divider(color: mediumGrey,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Media auto-download",style: subTitle),
              SizedBox(height: 10),
              Text("Voice messages are always automatically downloaded",style: subTitle,)
            ],
          ),
        ),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 60),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             titleSubtitle(context: context, isTrue: true,newTitle: "When using mobile data",newSubTitle: "No media"),
             SizedBox(height: 10,),
             titleSubtitle(context: context, isTrue: true,newTitle: "When connected on Wi-Fi",newSubTitle: "No media"),
             SizedBox(height: 10,),
             titleSubtitle(context: context, isTrue: true,newTitle: "When roaming",newSubTitle: "No media")
           ],
         ),
       )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: userProfileApp(context, "Storage and data"),
      body: _settingStorage(),
    );
  }
}
