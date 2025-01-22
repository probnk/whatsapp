import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/Provider/Setting%20Provider.dart';
import 'package:whatsapp/ReuseWidgets/ColumnRowsStuctures.dart';
import 'package:whatsapp/ReuseWidgets/NotificationControls.dart';
import 'package:whatsapp/ReuseWidgets/SwitchButton.dart';
import 'package:whatsapp/ReuseWidgets/settingAppbar.dart';

import '../../../Constants/Colors.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<Map<String?, dynamic>> notificationItems = [
    {"title": "Notification tone", "subTitle": "Default(notification_000)"},
    {"title": "Vibrate", "subTitle": "Default"},
    {"title": "Popup notification", "subTitle": "Not Available"},
    {"title": "Light", "subTitle": "White"}
  ];

  _notificationBody() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          Divider(color: mediumGrey),
          NotificationControls(
            notificationItems: notificationItems,
            newTitle: "Messages",
            highPriorityValue:
            context.watch<SettingProvider>().allowMessageHighPriority,
            highPriorityOnChange: (newValue) {
              context
                  .read<SettingProvider>()
                  .toggleAllowMessageHighPriority(newValue);
            },
            notificationReactionValue: context
                .watch<SettingProvider>()
                .allowMessageNotificationReaction,
            notificationReactionOnChange: (newValue) {
              context
                  .read<SettingProvider>()
                  .toggleAllowMessageNotificationReaction(newValue);
            },
          ),
          Divider(color: mediumGrey),
          NotificationControls(
            newTitle: "Groups",
            highPriorityValue:
            context.watch<SettingProvider>().allowGroupHighPriority,
            highPriorityOnChange: (newValue) {
              context
                  .read<SettingProvider>()
                  .toggleAllowGroupHighPriority(newValue);
            },
            notificationReactionValue:
            context.watch<SettingProvider>().allowGroupNotificationReaction,
            notificationReactionOnChange: (newValue) {
              context
                  .read<SettingProvider>()
                  .toggleAllowGroupNotificationReaction(newValue);
            }, notificationItems: notificationItems,
          ),
          Divider(color: mediumGrey),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Calls",style: subTitle),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ringtone",style: title),
                    Text("Default(ringtone_033)",style: subTitle),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Vibrate",style: title),
                    Text("Default[]",style: subTitle),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: userProfileApp(context, "Notifications"),
      backgroundColor: grey,
      body: _notificationBody(),
    );
  }
}