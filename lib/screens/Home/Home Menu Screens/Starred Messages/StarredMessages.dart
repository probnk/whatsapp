import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/ReuseWidgets/settingAppbar.dart';

class StarredMessages extends StatefulWidget {
  const StarredMessages({super.key});

  @override
  State<StarredMessages> createState() => _StarredMessagesState();
}

class _StarredMessagesState extends State<StarredMessages> {
  _starredMessagesBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(shape: BoxShape.circle, color: green),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black)),
            child: const Icon(Icons.star_border_rounded,
                color: Colors.black, size: 40),
          ),
        ),
        SizedBox(height: 40),
        Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(maxWidth: 170),
            child: Text(
              "Tap and hold on any messages in any chat to star it, so you can easily find it later.",
              style: subTitle,
              textAlign: TextAlign.center,
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: grey,
        appBar: userProfileApp(context, "Starred messages"),
        body: _starredMessagesBody());
  }
}
