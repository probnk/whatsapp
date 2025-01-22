import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/ReuseWidgets/settingAppbar.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {

  List<Map<String?,dynamic>> _helpItems = [
    {'icon':Icons.question_mark_rounded,'title':"Help center","subTitle":"Get help, contact us"},
    {'icon':Icons.insert_drive_file_outlined,'title':"Terms and Policy","subTitle":""},
    {'icon':Icons.perm_device_info_outlined,'title':"Channel reports","subTitle":""},
    {'icon':Icons.info_outline_rounded,'title':"App info","subTitle":""}
  ];

  _helpBody() {
    return ListView.builder(
        itemCount: _helpItems.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(_helpItems[index]['icon'],color: textGrey,size: 25),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_helpItems[index]['title'],style: title),
                    Text(_helpItems[index]['subTitle'],style: subTitle)
                  ],
                )
              ],
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: userProfileApp(context, "Help"),
      body: _helpBody(),
    );
  }
}
