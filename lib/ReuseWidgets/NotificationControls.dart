import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/ReuseWidgets/ColumnRowsStuctures.dart';
import 'package:whatsapp/ReuseWidgets/SwitchButton.dart';

class NotificationControls extends StatelessWidget {
  final String newTitle;
  final bool highPriorityValue;
  final Function(bool) highPriorityOnChange;
  final bool notificationReactionValue;
  final Function(bool) notificationReactionOnChange;
  final List<Map<String?,dynamic>> notificationItems;

  const NotificationControls({
    Key? key,
    required this.newTitle,
    required this.highPriorityValue,
    required this.highPriorityOnChange,
    required this.notificationReactionValue,
    required this.notificationReactionOnChange,
    required this.notificationItems
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(newTitle, style: subTitle),
        ListView.builder(
          itemCount: notificationItems.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: titleSubtitle(
                context: context,
                isTrue: false,
                items: notificationItems,
                index: index,
              ),
            );
          },
        ),
        SettingsRow(
          isDark: true,
          newTitle: "Use high priority notifications",
          newSubTitle: "Show previews of notifications at the top of the screen",
          providerValue: highPriorityValue,
          onChanged: highPriorityOnChange,
        ),
        SettingsRow(
          isDark: true,
          newTitle: "Reactions Notifications",
          newSubTitle: "Show notifications for reactions to messages you send",
          providerValue: notificationReactionValue,
          onChanged: notificationReactionOnChange,
        ),
      ],
    );
  }
}